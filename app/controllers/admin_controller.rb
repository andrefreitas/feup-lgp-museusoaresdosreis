class AdminController < ApplicationController

  def login
    respond_to do |format|
      format.json {
        if(params[:email] and params[:password])
              admin = Administrator.authenticate(params[:email], params[:password])
          if(admin)
            session[:administrator] = admin
            render json: {"result"=> "ok"}
          else
            render json: {"result"=> "error"}
          end
        else
          render json: {"result"=> "missingParams"}
        end
      }
      format.html
    end
  end

  def logout
    session[:administrator] = nil
    respond_to do |format|
      format.html {
        redirect_to(login_path)
      }
      format .json {
        render json: {"result" => "ok"}
      }
    end
  end

end

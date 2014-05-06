class AdminController < ApplicationController
  # Login
  def login
    respond_to do |format|
      format.json {
        if(params[:email] and params[:password])
              admin = Administrator.authenticate(params[:email], params[:password])
          if(admin)
            session[:administrator] = admin
            render json: {"result"=> "ok"}
          else
            render json: {"result"=> "invalid"}
          end
        else
          render json: {"result"=> "missingParams"}
        end
      }
      format.html {
        if(session[:administrator])
          redirect_to(events_path)
        end
      }
    end
  end

  #Logout
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

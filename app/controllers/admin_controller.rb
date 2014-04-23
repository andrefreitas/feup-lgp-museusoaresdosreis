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
        end
      }
      format.html
    end
  end

  def logout
    session[:administrator] = nil
    redirect_to(login_path, :notice => "Terminada a sessão de administrador")
  end
end

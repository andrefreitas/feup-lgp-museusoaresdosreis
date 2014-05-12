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

  def forgotPassword
    if(session[:administrator])
      redirect_to(events_path)
    end
 end
  def generatePassword
    if(session[:administrator])
      redirect_to(events_path)
    end
    @user = Administrator.where(email: params[:email]).first
    user = Administrator.where(email: params[:email]).first
    
    respond_to do |format|
      format.json {
	if(@user == nil)
          render json: {"result"=> "invalid"}
        else
          render json: {"result"=> "ok"}
          tempPass = rand(36**8).to_s(36)
          @user.password = Digest::SHA1.hexdigest(tempPass)
          @user.save
          MuseuMailer.restorePassword(@user, tempPass).deliver
        end

      }
   end
   end   

end

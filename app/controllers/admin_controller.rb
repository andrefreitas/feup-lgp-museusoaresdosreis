class AdminController < ApplicationController
  before_action :check_auth , :only => [:home, :addAdmin, :addEvent]

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
          redirect_to(admin_path)
        end
      }
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

  def home
  end

  def check_auth
    if(session[:administrator].nil?)
      redirect_to(login_path)
    end
    @administrator = session[:administrator]
  end

  def addAdmin
  end

  def listAdmins
    @admins = Administrator.all
  end

  def create
  end

  def addEvent
  end

end

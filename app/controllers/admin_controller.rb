class AdminController < ApplicationController

  def login
    if(params[:email] and params[:password])
      session[:administrator] = Administrator.authenticate(params[:email], params[:password])
      if(session[:administrator])
        redirect_to(administrator_path)
      else
        redirect_to(login_path, :notice => "Login inválido!")
      end
    end
  end

  def logout
    session[:administrator] = nil
    redirect_to(login_path, :notice => "Terminada a sessão de administrador")
  end

  def login_is_valid
  	email = params[:email]
  	password = params[:password]
    @administrator = Administrator.authenticate(email, password)
    respond_to do |format|
      format .json {render json:@administrator}
    end
  end
end

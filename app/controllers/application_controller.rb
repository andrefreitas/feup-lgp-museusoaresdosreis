class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def check_auth
    if(session[:administrator].nil?)
      redirect_to(login_path)
    end
    @adminSession = session[:administrator]
  end

end
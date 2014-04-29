class AdministratorController < ApplicationController
  def index
  end

  def new
  end
  def create
   @administrator = Administrator.create(:name => params['name'], :email => params['email'], :password => params['password'])
   respond_to do |format|
    format.html # show.html.erb
  format.json { render :json => @administrator }
   end
  end

  def destroy
  end

  def show
  end
end

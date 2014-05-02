class AdministratorController < ApplicationController
  before_action :find , :only => [:update, :destroy, :show]

  def find
    @administrator = Administrator.find(params[:id])
  end

  def index
    @administrator = Administrator.all
    respond_to do |format|
      format.html
      format.json{render :json => @administrator}
    end
  end

  def new
  end

  def update
    @administrator_alt = Administrator.find(params[:id])
    @administrator.update(:name => params[:name], :email => params[:email], :password => params[:password])
    respond_to do |format|
      format.html
      format.json{render :json => @administrator}
    end
  end

  def create
    @administrator = Administrator.create(:name => params['name'], :email => params['email'], :password => params['password'])
    respond_to do |format|
      format.html
      format.json{render :json => @administrator}
    end
  end

  def destroy
    @administrator.destroy
  end

  def show
    respond_to do |format|
      format.html
      format.json{render :json => @administrator}
    end
  end
end

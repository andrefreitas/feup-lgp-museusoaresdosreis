class AdministratorsController < ApplicationController
  before_action :find , :only => [:update, :destroy, :show]
  before_action :check_auth, :only => [:new, :create, :update, :edit, :destroy, :index, :show]

  def find
    @administrator = Administrator.find(params[:id])
  end

  def new
  end

  def create
    @administrator = Administrator.create(:name => params['name'], :email => params['email'], :password => params['password'])
    respond_to do |format|
      format.html
      format.json{render :json => @administrator}
    end
  end

  def update
    @administrator_alt = Administrator.find(params[:id])
    @administrator.update(:name => params[:name], :email => params[:email], :password => params[:password])
    respond_to do |format|
      format.html
      format.json{render :json => @administrator}
    end
  end

  def edit
  end

  def destroy
    @administrator.destroy
  end

  def index
    @administrator = Administrator.all
    respond_to do |format|
      format.html
      format.json{render :json => @administrator}
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json{render :json => @administrator}
    end
  end
end

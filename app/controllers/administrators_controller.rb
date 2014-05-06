class AdministratorsController < ApplicationController
  before_action :find , :only => [:update, :destroy, :show, :edit]
  before_action :check_auth, :only => [:new, :create, :update, :edit, :destroy, :index, :show]

  def find
    @administrator = Administrator.find(params[:id])
  end

  def new
  end

  def create
    name = params[:name]
    email = params[:email]
    password = params[:password]
    if(Administrator.where(email: email).empty?)
      @administrator = Administrator.create(:name => name, :email => email, :password => password)
      @result = @administrator
    else
      @result = ["emailExists"]
    end
    respond_to do |format|
      format.json{render :json => @result}
    end
  end

  def update
    @administrator = Administrator.find(params[:id])
    if(Administrator.where(email: params[:email]).where.not(id: params[:id]).empty?)
      args = {:name => params[:name], :email => params[:email]}
      if(!params[:password].empty?)
        args[:password] = params[:password]
      end
      @administrator.update(args)
      @result = @administrator
    else
      @result = ["emailExists"]
    end
      respond_to do |format|
      format.json{render :json => @result}
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

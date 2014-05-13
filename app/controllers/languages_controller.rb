class LanguagesController < ApplicationController

  before_action :check_auth, :only => [:new, :create, :destroy, :index]

  def new
  end

  def create
    name = params[:name]
    code = params[:code]
    if Language.where(code: code).empty?
      @language = Language.create(:name => name, :code => code)
      @result = @language
    else
      @result = ["codeExists"]
    end
    respond_to do |format|
      format.json{render :json => @result}
    end
  end

  def destroy
    @language = Language.find(params[:id])
    @language.destroy
  end

  def index
    @language = Language.all
    respond_to do |format|
      format.html
      format.json{render :json => @language}
    end
  end
end

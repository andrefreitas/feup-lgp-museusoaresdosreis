# encoding: UTF-8
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
    if(params[:notice] == "new")
      flash[:notice] = "Língua adicionada com sucesso"
    elsif (params[:notice] == "deleted")
      flash[:notice] = "Língua removida com sucesso"
    end

    @missingLangs = Language.getMissingLangs()
    @language = Language.all
    respond_to do |format|
      format.html
      format.json{render :json => @language}
    end
  end

  def getMissingLangs
    langs = Language.getMissingLangs()
    respond_to do |format|
      format.json{render :json => langs}
    end
  end

  def changeLang
    code = params[:code]
    session[:language] = code
    respond_to do |format|
      format.json {
        render json: {"result"=> "ok"}
      }
    end
  end
end

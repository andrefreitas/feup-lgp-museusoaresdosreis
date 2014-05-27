class EventTranslationsController < ApplicationController
	before_action :check_auth, :only => [:new, :create, :update, :edit, :destroy, :index, :show]
  before_action :find , :only => [:update, :destroy, :show, :edit]

  def find
    @EventTranslation = EventTranslation.find(params[:id])
  end
  def show
  	respond_to do |format|
  		format.json {
  			render json: {"title"=> @EventTranslation.title, "content"=> @EventTranslation.content }
  			
  		}
  	end
  end
  def create
  	title = params[:title]
  	content = params[:content]
  	language = params[:language]
  	event = params[:event]

  	Event_translation.create(title: title, content: content, language: language, event: event);
  end
 def updateTranslation

 	Rails.logger.debug params.inspect
 	title = params[:title]
  	content = params[:content]
  	language = params[:language]
  	event = params[:event]
  	@EventTranslation = EventTranslation.where(event_id:event, lang:language).first
  	@EventTranslation.title = title
  	@EventTranslation.content = content
  	@EventTranslation.save

 end
 def findTranslation
 	@EventTranslation = EventTranslation.where(event_id:params[:id],lang:params[:language]).first

 	respond_to do |format|
  		format.json {
  			if(@EventTranslation == nil)
  				render json: {result: "none"}
  			else
  				render json: {title: @EventTranslation.title, content: @EventTranslation.content, result:"found"}
  			end
  			#render json: {"title"=> "ok"}
  		}
  	end
 end

 def new
 end
end

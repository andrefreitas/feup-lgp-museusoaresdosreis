class MediaController < ApplicationController

  before_action :check_language, :only => [:index, :getDates, :getEvents, :getImage, :getEvent]

  def index
    @language = Language.all
  end

  def getDates
    @dates = Event.where(published: true).select("date").map(&:date).uniq
    respond_to do |format|
      format.json{render :json => @dates}
    end
  end

  def getImage
    imageID = params[:id]
    respond_to do |format|
      format.json{render :json => Image.find(imageID)}
    end
  end

  def getEvent
    eventID = params[:id]
    respond_to do |format|
      format.json{render :json => Event.find(eventID)}
    end
  end

  def getEvents
    respond_to do |format|
      format.json{render :json => Event.where(published: true).map{|e| {:event => e, :images => e.images}}}
    end
  end
  def getTranslations
    respond_to do |format|
      format.json{render :json => EventTranslations.where(published: true).map{|e| {:event => e, :images => e.images}}}
    end
  end

  def puzzle

  end
  def getTranslationEvent
    eventID = params[:id];
    language = params[:language]
    type = params[:type]
    respond_to do |format|
      if(type == 'event')
        format.json{render :json => EventTranslation.where(event_id: eventID, lang: language)}
      else
        path = params[:path]
        translation = EventTranslation.where(event_id: eventID, lang: language)[0];
        format.json{render :json => ImageTranslation.where(event_translation_id: translation.id, path: path)}
      end
    end
  end


end

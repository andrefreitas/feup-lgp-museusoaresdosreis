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

  def puzzle

  end
end

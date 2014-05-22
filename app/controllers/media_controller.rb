class MediaController < ApplicationController
  def index

  end

  def getDates
    @dates = Event.all.select("date").map(&:date).uniq
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

  def getEvents
    respond_to do |format|
      format.json{render :json => Event.all.map{|e| {:event => e, :images => e.images}}}
    end
  end

  def puzzle

  end
end

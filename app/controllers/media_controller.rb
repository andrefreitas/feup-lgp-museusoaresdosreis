class MediaController < ApplicationController
  def index

  end

  def getDates
    @dates = Event.all.select("date")
    respond_to do |format|
      format.json{render :json => @dates}
    end
  end
end

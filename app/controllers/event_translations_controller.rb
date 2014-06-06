class EventTranslationsController < ApplicationController
	before_action :check_auth, :only => [:new, :create, :show]
  before_action :find , :only => [ :show]

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

  	Event_translation.create(title: title, content: content, language: language, event: event)
  end

 def updateTranslation

 	Rails.logger.debug params.inspect
 	title = params[:title]
  	content = params[:content]
  	language = params[:language]
  	event = params[:event]
    titleimg1 = params[:translatedTitle_img1]
    captionimg1 = params[:translatedCaption1]
    titleimg2 = params[:translatedTitle_img2]
    captionimg2 = params[:translatedCaption2]
    titleimg3 = params[:translatedTitle_img3]
    captionimg3 = params[:translatedCaption3]

  	@EventTranslation = EventTranslation.where(event_id:event, lang:language).first
  	@EventTranslation.title = title
  	@EventTranslation.content = content

    @image1 = @EventTranslation.image_translation[0]
    @image2 = @EventTranslation.image_translation[1]
    @image3 = @EventTranslation.image_translation[2]

    @true_images = Event.find(event).images
    @true_image1 = @true_images[0]
    @true_image2 = @true_images[1]
    @true_image3 = @true_images[2]

    if @image1
      @image1.title = titleimg1
      @image1.caption = captionimg1
      @image1.save
    else
      if @true_image1
        @EventTranslation.image_translation.create(path: @true_image1.path, caption: captionimg1, title: titleimg1)
      end
    end
    if @image2
      @image2.title = titleimg2
      @image2.caption = captionimg2
      @image2.save
    else
      if @true_image2
        @EventTranslation.image_translation.create(path: @true_image2.path, caption: captionimg2, title: titleimg2)
      end
    end
    if @image3
      @image3.title = titleimg3
      @image3.caption = captionimg3
      @image3.save
    else
      if @true_image3
        @EventTranslation.image_translation.create(path: @true_image3.path, caption: captionimg3, title: titleimg3)
      end
    end

  	@EventTranslation.save

 end

 def findTranslation
 	@EventTranslation = EventTranslation.where(event_id:params[:id],lang:params[:language]).first

 	respond_to do |format|
  		format.json {
  			if(@EventTranslation == nil)
  				render json: {result: "none"}
  			else
  				render json: {title: @EventTranslation.title, content: @EventTranslation.content, images: @EventTranslation.image_translation, result:"found"}
  			end
  			#render json: {"title"=> "ok"}
  		}
  	end
 end

 def new
 end
end

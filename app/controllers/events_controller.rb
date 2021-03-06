class EventsController < ApplicationController
  before_action :check_auth, :only => [:new, :create, :update, :edit, :destroy, :index, :show]
  before_action :find , :only => [:update, :destroy, :show, :edit]

  def find
    @event = Event.find(params[:id])
  end

  def new
  end

  def create
    title = params[:title]
    date = params[:date]
    content = params[:content]
    image1 = params[:image1]
    caption1 = params[:caption1]
    title_img1 = params[:title_img1]
    image2 = params[:image2]
    caption2 = params[:caption2]
    title_img2 = params[:title_img2]
    image3 = params[:image3]
    caption3 = params[:caption3]
    title_img3 = params[:title_img3]
    directory = "public/data"

    @event = Event.create(title: title, date: date, content: content)

    if(image1)
      hash = Time.new.to_formatted_s(:number) + "_" + rand(9999).to_s + File.extname(image1.original_filename)
      path = File.join(directory, hash)
      @image = @event.images.create(name: image1.original_filename, path: path, hashcode: hash, caption: caption1, title: title_img1)
      Image.uploadFile(image1,hash)
    end

    if(image2)
      hash = Time.new.to_formatted_s(:number) + "_" + rand(9999).to_s + File.extname(image2.original_filename)
      path = File.join(directory, hash)
      @image = @event.images.create(name: image2.original_filename, path: path, hashcode: hash, caption: caption2, title: title_img2)
      Image.uploadFile(image2,hash)
    end

    if(image3)
      hash = Time.new.to_formatted_s(:number) + "_" + rand(9999).to_s + File.extname(image3.original_filename)
      path = File.join(directory, hash)
      @image = @event.images.create(name: image3.original_filename, path: path, hashcode: hash, caption: caption3, title: title_img3)
      Image.uploadFile(image3,hash)
    end

    languages = Language.all
    languages.each do |language|
    	if language.code != 'pt'
    		EventTranslation.create(title:"",content:"", lang:language.code, event:@event)
    	end
    end
    redirect_to(events_path, :notice => "Evento criado com sucesso!")
  end

  def update
    title = params[:title]
    date = params[:date]
    content = params[:content]
    image1 = params[:image1]
    caption1 = params[:caption1]
    title_img1 = params[:title_img1]
    image2 = params[:image2]
    caption2 = params[:caption2]
    title_img2 = params[:title_img2]
    image3 = params[:image3]
    caption3 = params[:caption3]
    title_img3 = params[:title_img3]
    published = params[:published]
    directory = "public/data"

    @event.title = title
    @event.date = date
    @event.content = content
    if published == "1"
      @event.published = true
    else
      @event.published = false
    end
    @image1 = @event.images[0]
    @image2 = @event.images[1]
    @image3 = @event.images[2]
    @event.save
    if @image1
      @image1.title = title_img1
      @image1.caption = caption1
      @image1.save
    end
    if @image2
      @image2.title = title_img2
      @image2.caption = caption2
      @image2.save
    end
    if @image3
      @image3.title = title_img3
      @image3.caption = caption3
      @image3.save
    end
    if image1
      if @image1
        @image1.deleteFile()
        @image1.destroy
      end
      hash = Time.new.to_formatted_s(:number) + "_" + rand(9999).to_s + File.extname(image1.original_filename)
      path = File.join(directory, hash)
      @image = @event.images.create(name: image1.original_filename, path: path, hashcode: hash, caption: caption1, title: title_img1)
      Image.uploadFile(image1,hash)
    end
    if image2
      if @image2
        @image2.deleteFile()
        @image2.destroy
      end
      hash = Time.new.to_formatted_s(:number) + "_" + rand(9999).to_s + File.extname(image2.original_filename)
      path = File.join(directory, hash)
      @image = @event.images.create(name: image2.original_filename, path: path, hashcode: hash, caption: caption2, title: title_img2)
      Image.uploadFile(image2,hash)
    end
    if image3
      if @image3
        @image3.deleteFile()
        @image3.destroy
      end
      hash = Time.new.to_formatted_s(:number) + "_" + rand(9999).to_s + File.extname(image3.original_filename)
      path = File.join(directory, hash)
      @image = @event.images.create(name: image3.original_filename, path: path, hashcode: hash, caption: caption3, title: title_img3)
      Image.uploadFile(image3,hash)
    end
    redirect_to(events_path, :notice => "Evento atualizado com sucesso!")
  end

  def edit
    @event = Event.find(params[:id])
    @languages = Language.all
  end

  def translate
    @event = Event.find(params[:id])
    @languages = Language.all
  end

  def destroy
    eventID = @event.id
    images = Image.where(:event_id => eventID)
    images.each do |image|
      image.deleteFile()
    end

    #Delete Translations
    translations = EventTranslation.where(event_id:@event.id)
    translations.each do |translation|
    	translation.destroy
    end

    @event.destroy
  end

  def index
   @events = Event.all
  end

  def show
  end
end

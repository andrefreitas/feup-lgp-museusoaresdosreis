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
    image2 = params[:image2]
    image3 = params[:image3]
    directory = "public/data"

    @event = Event.create(title: title, date: date, content: content)

    if(image1)
      hash = Time.new.to_formatted_s(:number) + "_" + rand(9999).to_s + File.extname(image1.original_filename)
      path = File.join(directory, hash)
      @image = @event.images.create(name: image1.original_filename, path: path, hashcode: hash)
      Image.uploadFile(image1,hash)
    end

    if(image2)
      hash = Time.new.to_formatted_s(:number) + "_" + rand(9999).to_s + File.extname(image2.original_filename)
      path = File.join(directory, hash)
      @image = @event.images.create(name: image2.original_filename, path: path, hashcode: hash)
      Image.uploadFile(image2,hash)
    end

    if(image3)
      hash = Time.new.to_formatted_s(:number) + "_" + rand(9999).to_s + File.extname(image3.original_filename)
      path = File.join(directory, hash)
      @image = @event.images.create(name: image3.original_filename, path: path, hashcode: hash)
      Image.uploadFile(image3,hash)
    end

    redirect_to(events_path, :notice => "Evento criado com sucesso!")
  end

  def update
    title = params[:title]
    date = params[:date]
    content = params[:content]
    image1 = params[:image1]
    image2 = params[:image2]
    image3 = params[:image3]
    directory = "public/data"

    @event.title = title
    @event.date = date
    @event.content = content
    @image1 = @event.images[0]
    @image2 = @event.images[1]
    @image3 = @event.images[2]
    @event.save
    if image1
      if @image1
        @image1.deleteFile()
        @image1.destroy
      end
      hash = Time.new.to_formatted_s(:number) + "_" + rand(9999).to_s + File.extname(image1.original_filename)
      path = File.join(directory, hash)
      @image = @event.images.create(name: image1.original_filename, path: path, hashcode: hash)
      Image.uploadFile(image1,hash)
    end
    if image2
      if @image2
        @image2.deleteFile()
        @image2.destroy
      end
      hash = Time.new.to_formatted_s(:number) + "_" + rand(9999).to_s + File.extname(image2.original_filename)
      path = File.join(directory, hash)
      @image = @event.images.create(name: image2.original_filename, path: path, hashcode: hash)
      Image.uploadFile(image2,hash)
    end
    if image3
      if @image3
        @image3.deleteFile()
        @image3.destroy
      end
      hash = Time.new.to_formatted_s(:number) + "_" + rand(9999).to_s + File.extname(image3.original_filename)
      path = File.join(directory, hash)
      @image = @event.images.create(name: image3.original_filename, path: path, hashcode: hash)
      Image.uploadFile(image3,hash)
    end
    redirect_to(events_path, :notice => "Evento atualizado com sucesso!")
  end

  def edit
  end

  def destroy
    eventID = @event.id
    images = Image.where(:event_id => eventID)
    images.each do |image|
      image.deleteFile()
    end
    @event.destroy
  end

  def index
    @events = Event.all
  end

  def show
  end
end

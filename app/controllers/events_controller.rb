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

    @event = Event.create(title: title, date: date, content: content)

    if(image1)
      @image = @event.images.create(name: image1.original_filename, path: image1.original_filename)
      Image.uploadFile(image1)
    end

    if(image2)
      @image = @event.images.create(name: image2.original_filename, path: image2.original_filename)
      Image.uploadFile(image2)
    end

    if(image3)
      @image = @event.images.create(name: image3.original_filename, path: image3.original_filename)
      Image.uploadFile(image3)
    end

    redirect_to(events_path, :notice => "Evento criado com sucesso!")
  end

  def update
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

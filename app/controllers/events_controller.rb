class EventsController < ApplicationController
  before_action :check_auth, :only => [:new, :create, :update, :edit, :destroy, :index, :show]

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
      @image = Image.create(name: image1.original_filename, path: image1.original_filename)
      Image.uploadFile(image1)
      @image.event_id = @event.id
    end

    if(image2)
      @image = Image.create(name: image2.original_filename, path: image2.original_filename)
      Image.uploadFile(image2)
      @image.event_id = @event.id
    end

    if(image3)
      @image = Image.create(name: image3.original_filename, path: image3.original_filename)
      Image.uploadFile(image3)
      @image.event_id = @event.id
    end
    redirect_to(events_path, :notice => "Evento criado com sucesso!")
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
  end

  def show
  end
end

class EventsController < ApplicationController
  
  def index
  	@events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end 
    
  def create
    @event = Event.new(title: params[:title], location: params[:location], price: params[:price], description: params[:description], start_date: params[:start_date], duration: params[:duration])

    if @event.save
      flash[:success] = "Event successfully created"
      redirect_to root_path
    else
      flash[:failure] = "Invalid input"
      render :new
    end
  end

end

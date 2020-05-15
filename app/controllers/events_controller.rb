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
		@event = Event.new('title' => params[:title], 
      'description' => params[:description],
      'duration' => params[:duration],
      'start_date' => params[:start_date],
      'price' => params[:price],
      'location' => params[:location],
      'manager_id' => current_user.id)

    if @event.save
      flash[:success] = "Event successfully created"
      redirect_to root_path
    else
      flash[:failure] = "Invalid input"
      render :new
    end
  end

end

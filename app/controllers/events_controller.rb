class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def show
    set_event
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)
    if @event.save
      flash[:notice] = "Event's details Added Successfully!"
      redirect_to events_path
    else
      flash[:error] = "Event can't be added!"
      render :new
    end
  end

  def edit
    set_event
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      flash[:notice] = "Event's records Updated Successfully !"
      redirect_to events_path
    else
      flash[:error] = "Oops, Updation Operation Failed!"
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    if @event.destroy
      flash[:notice] = "Event's records Deleted Successfully !"
      redirect_to events_path
    else
      flash[:notice] = "Oops, Deletion Operation Failed !"
    end
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:name, :description, :event_date, :usser_id)
    end
end

class EventsController < ApplicationController

  #add callbacks
  before_action :set_event, only: [:show, :edit, :update, :destroy]
	before_action :require_user, except: [:show, :index]
	before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    #Searching Orders Record by Status
    if params[:search]
      @events = Event.where('category_id=?',params[:search])
    else
      @events = Event.order("event_date desc")
    end
  end

  def show
    set_event
  end

  def new
    @event = Event.new
  end

  #define create method
  def create
    @event = Event.new(event_params)
    @event.usser = current_user
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

  #define update method
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
      params.require(:event).permit(:name, :description, :event_date, :usser_id ,:category_id)
    end

    def require_same_user
      if current_user !=  @event.usser
        flash[:alert] = "You can only Edit and Delete your Events !"
        redirect_to events_path
      end
    end
end

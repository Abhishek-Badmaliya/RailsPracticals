class EventsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
    if @event.update(event_params)
      flash[:notice] = "Event details updated successfully."
      redirect_to @event
    else
      render 'edit'
    end
  end

  def destroy
  end

  private
    def event_params
      params.require(:event).permit(:name, :description, :event_date)
    end
end

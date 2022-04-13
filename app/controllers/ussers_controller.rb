class UssersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update]
  
  def index
    @ussers = Usser.all
  end

  def show
    @events =@usser.events
  end

  def new
    @usser = Usser.new
  end

  def create
    @usser = Usser.new(usser_params)
    if @usser.save
      session[:usser_id] = @usser.id
      flash[:notice] = "Welcome to Events #{@usser.user_name}!"
      redirect_to events_path
    else
      flash[:error] = "User can't be added!"
      render :new
    end
  end

  def edit
    @usser = Usser.find(params[:id])
  end

  def update
    @usser = Usser.find(params[:id])
    if @usser.update(usser_params)
      flash[:notice] = "User's records Updated Successfully !"
      redirect_to ussers_path
    else
      flash[:notice] = "Oops, Updation Operation Failed !"
      render :edit
    end
  end

  def destroy
    @usser = Usser.find(params[:id])
    if @usser.destroy
      flash[:notice] = "User's records Deleted Successfully !"
      redirect_to ussers_path
    else
      flash[:notice] = "Oops, Deletion Operation Failed !"
    end
  end

  private
    def set_usser
      @usser = Usser.find(params[:id])
    end

    def usser_params
      params.require(:usser).permit(:user_name, :user_email, :password)
    end
end

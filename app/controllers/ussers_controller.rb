class UssersController < ApplicationController

  #add callbacks
  before_action :set_usser, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:edit, :update]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  
  def index
    @ussers = Usser.all
  end

  def show
    @events =@usser.events
  end

  def new
    @usser = Usser.new
    @usser.build_address
  end

  #define create method
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
    @usser.destroy
    session[:usser_id] = nil
    flash[:notice] = "Acconut and all records deleted !!!"
    redirect_to events_path
  end

  #define method for enroll
  def enroll
    @usser = Usser.find_by(id: session[:usser_id])
    if session[:usser_id] && params[:event_id]
      Enrollment.create(usser_id:session[:usser_id],event_id:params[:event_id])
      redirect_to events_path
    end
  end

  #define method for unroll
  def unenroll
    enrollment = Enrollment.find_by("usser_id=? and event_id=?",current_user,params[:event_id])
    enrollment.destroy
    redirect_to events_path
  end

  private
    def set_usser
      @usser = Usser.find(params[:id])
    end

    def usser_params
      params.require(:usser).permit(:user_name, :user_email, :password, address_attributes: [:usser_address])
    end

    def require_same_user
      if current_user !=  @usser
        flash[:alert] = "You can only edit your profile !"
        redirect_to ussers_path
      end
    end
end

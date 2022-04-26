class NewusersController < ApplicationController
  #add callback
  before_action :set_newuser, only: [:show, :edit, :update, :destroy]

  def index
    @newusers = Newuser.all
  end

  def new
    @newuser = Newuser.new
  end

  def create
    @newuser = Newuser.new(newuser_params)
    if @newuser.save
      flash[:notice] = "User's Details has been Added Successfully !"
      redirect_to newusers_path
    else
      render 'new'
    end
  end

  def edit
  end

  def show
  end

  def update
    @newuser = Newuser.find(params[:id])
    if @newuser.update(newuser_params)
      flash[:notice] = "User's Records has been Updated Successfully !"
      redirect_to newusers_path
    else
      render :edit
    end
  end

  def destroy
    @newuser.destroy
    redirect_to newusers_path
  end

  private
    def set_newuser
      @newuser = Newuser.find(params[:id])
    end

    def newuser_params
      params.require(:newuser).permit(:name, :email, :picture)
    end
end

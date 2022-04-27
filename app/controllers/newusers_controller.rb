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
      NewuserMailer.with(newuser: @newuser).welcome_email.deliver_now
      flash[:notice] = "User's Details has been Added Successfully !"
      redirect_to newusers_path(@newuser)
    else
      render 'new'
    end
  end

  def edit
  end

  def show
  end

  def update
    old_email = @newuser.email
    if @newuser.update(newuser_params)
      NewuserMailer.with(newuser: @newuser).update_email.deliver_now if old_email != @newuser.email
      flash[:notice] = "User's Records has been Updated Successfully !"
      redirect_to @newuser
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

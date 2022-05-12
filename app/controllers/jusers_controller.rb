class JusersController < ApplicationController
  #add callback
  before_action :set_juser, only: [:show, :edit, :update, :destroy]

  def index
    @jusers = Juser.all
  end

  def new
    @juser = Juser.new
  end

  def create
    @juser = Juser.new(juser_params)
    if @juser.save
      flash[:notice] = "User's Details has been Added Successfully!"
      redirect_to jusers_path(@juser)
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @juser.update(juser_params)
      flash[:notice] = "User's Records has been Updated Successfully!"
      redirect_to jusers_path
    else
      render :edit
    end
  end

  def destroy
    @juser.destroy
    redirect_to jusers_path
  end

  private
    def set_juser
      @juser = Juser.find(params[:id])
    end

    def juser_params
      params.require(:juser).permit(:first_name, :last_name, :email, :password, :subscription, :subscription_email)
    end
end

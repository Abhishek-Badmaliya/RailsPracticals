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

  def profile
    @juser = Juser.find(params[:id])
  end

  def update_profile
    @juser = Juser.find(params[:id])
    respond_to do |format|
      if @juser.update(juser_params)
        flash[:notice] = "User Profile has been Updated Successfully!"
      else
        flash[:errors] = @juser.errors.full_messages
      end
      format.js
    end
  end

  def change_password
    @juser = Juser.find(params[:id])
  end

  def update_password
    @juser = Juser.find(params[:id])
    respond_to do |format|
      if @juser.update_attribute(:password, params[:juser][:password])
        flash[:notice] = "User Password has been Updated Successfully!"
        redirect_to jusers_path
      else
        flash[:errors] = @juser.errors.full_messages
        redirect_to update_password_juser_path(@juser)
      end
      format.js
    end
  end

  private
    def set_juser
      @juser = Juser.find(params[:id])
    end

    def juser_params
      params.require(:juser).permit(:first_name, :last_name, :email, :password, :subscription, :subscription_email)
    end
end

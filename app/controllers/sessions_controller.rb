class SessionsController < ApplicationController
  def new
  
  end

  def create
    user = Usser.find_by(user_email: params[:session] [:user_email])
    if user && user.authenticate(params[:session][:password])
      session[:usser_id] = user.id
      flash[:notice] = "Logged in Successfully !"
      redirect_to ussers_path
    else
      flash.now[:alert] = "There was something wring with your login details"
      render "new"
    end
  end

  def destroy
    session[:usser_id] = nil
    flash[:notice] = "Logged Out !"
    redirect_to events_path
  end
end

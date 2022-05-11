class ApplicationController < ActionController::API

  #add callback
  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= Usser.find(session[:usser_id]) if session[:usser_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:alert] = "You must be logged in !"
      redirect_to login_path
    end
  end

  #create method for nuser's role which is use private
  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
  end
end

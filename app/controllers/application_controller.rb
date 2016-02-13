class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception


  def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << :first_name 
      devise_parameter_sanitizer.for(:sign_up) << :last_name
      devise_parameter_sanitizer.for(:sign_up) << :location
      devise_parameter_sanitizer.for(:sign_up) << :nationality
      devise_parameter_sanitizer.for(:sign_up) << :bio
      devise_parameter_sanitizer.for(:sign_up) << :avatar
      devise_parameter_sanitizer.for(:account_update) << :avatar
      devise_parameter_sanitizer.for(:account_update) << :first_name
      devise_parameter_sanitizer.for(:account_update) << :bio
      devise_parameter_sanitizer.for(:account_update) << :admin

  end


  rescue_from ActiveRecord::RecordNotFound do
    flash[:warning] = 'Resource not found.'
    redirect_back_or root_path
  end

  def redirect_back_or(path)
    redirect_to request.referer || path
  end

 
  	private

end
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception


  def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << :first_name 
      devise_parameter_sanitizer.for(:sign_up) << :last_name
      devise_parameter_sanitizer.for(:sign_up) << :location
  end

 
  	private
  	# def current_user
   # 		 User.where(id: session[:user_id]).first
   #  end
  	# helper_method :current_user, :logged_in?

   #   def logged_in?
   #     current_user != nil
   #   end
 


end
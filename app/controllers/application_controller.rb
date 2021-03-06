class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception


   # ==== Examples
  # glyph(:share_alt)
  # # => <i class="icon-share-alt"></i>
  # glyph(:lock, :white)
  # # => <i class="icon-lock icon-white"></i>

  def glyph(icon_name_postfix, hash={})
    content_tag :span, nil, hash.merge(class: "glyphicon glyphicon-#{icon_name_postfix.to_s.gsub('_','-')}")
  end


  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied!"
    redirect_to root_url
  end

  #include CanCan::ControllerAdditions

  protect_from_forgery
  # rescue_from CanCan::AccessDenied do |exception|
  #   flash[:error] = exception.message
  #   redirect_to root_url
  # end

  def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << :first_name 
      devise_parameter_sanitizer.for(:sign_up) << :last_name
      devise_parameter_sanitizer.for(:sign_up) << :location
      devise_parameter_sanitizer.for(:sign_up) << :nationality
      devise_parameter_sanitizer.for(:sign_up) << :bio
      devise_parameter_sanitizer.for(:sign_up) << :avatar
      devise_parameter_sanitizer.for(:sign_up) << :role_id
      devise_parameter_sanitizer.for(:sign_up) << :native_language
      devise_parameter_sanitizer.for(:sign_up) << :learning_language

      devise_parameter_sanitizer.for(:account_update) << :avatar
      devise_parameter_sanitizer.for(:account_update) << :first_name
      devise_parameter_sanitizer.for(:account_update) << :bio
      devise_parameter_sanitizer.for(:account_update) << :admin
      devise_parameter_sanitizer.for(:account_update) << :approved
      devise_parameter_sanitizer.for(:account_update) << :role_id

  end


  rescue_from ActiveRecord::RecordNotFound do
    flash[:warning] = 'Resource not found.'
    redirect_back_or root_path
  end

  def redirect_back_or(path)
    redirect_to request.referer || path
  end

 
  	private



  protected

  
end
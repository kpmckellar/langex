class Users::RegistrationsController < Devise::RegistrationsController


before_filter :configure_permitted_parameters
before_filter :configure_account_update_params, only: [:update]
# before_filter :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
    # @user = User.new
     # build_resource({})
     #  resource.languages_users.build
     # respond_with self.resource
  # end
    #2.times { user.languages_users.build} 

    
  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

 


  protected

      def configure_permitted_parameters

      devise_parameter_sanitizer.for(:sign_up) { |u|
        u.permit(:email, :password, :password_confirmation, :bio, :location, :last_name, :first_name, :nationality, :avatar, :referral_code, :native_language, :learning_language, :college_id, languages_users_attributes: [:language_id, :level]) }
      end

      def configure_account_update_params
      devise_parameter_sanitizer.for(:account_update) { |u|
        u.permit(:email, :password, :password_confirmation, :current_password, :admin, :approved, :role_id, :bio, :location, :last_name, :first_name, :nationality, :avatar, :referral_code, :native_language, :learning_language, :college_id, languages_users_attributes: [:language_id, :level]) }
      end
  
  # def sign_up_params(:user)
  #   #allow = [:email, :password, :password_confirmation, [languages_user_attributes: [:language_id, :user_id, :level]]]
  #   # params.require(resource_name).permit(allow)
  #   params.require(:user).permit(:email, :password, :password_confirmation, [languages_user_attributes: [:language_id, :user_id, :level]])

  # end

  # def languages_user_params
  #     params.require(:languages_user).permit(:language_id, :level, :user_id)
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.for(:sign_up) << :attribute
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.for(:account_update) << :attribute
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #    new_languages_user_path(resource)
  # end

  def after_inactive_sign_up_path_for(resource)

    session[:current_user_id] = resource.id
    '/profile/waitlist' # Or :prefix_to_your_route


  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end

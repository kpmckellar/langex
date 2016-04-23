class Users::RegistrationsController < Devise::RegistrationsController
# before_filter :configure_sign_up_params, only: [:create]
# before_filter :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    # @user = User.new
     build_resource({})
      resource.languages_users.build
     respond_with self.resource
  end
    #2.times { user.languages_users.build} 

    
  # POST /resource
  def create
    super
  end

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

  # protected



  protected

      def configure_permitted_parameters

      devise_parameter_sanitizer.for(:sign_up) { |u|
        u.permit(:email, :password, :password_confirmation, :bio, :location, :last_name, :first_name, :nationality, :avatar, languages_users_attributes: [:language_id, :level]) }
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
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end

class ProfileController < ApplicationController

	def home
		@user = current_user
	end

	def create_lang
		@language = Language.all
		#@languages_user = LanguagesUser.new(create_language_params)
		#@user_id = current_user
		@languages_user = LanguagesUser.new(params[:user_id])
	end

end
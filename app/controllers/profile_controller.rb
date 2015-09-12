class ProfileController < ApplicationController

	def home
		@fluent_languages = LanguagesUser.where(user: current_user.id).where("level > 4")
  		@nonfluent_languages = LanguagesUser.where("level < 5").where(user: current_user.id)

  		@fluent_lang = LanguagesUser.where("level > 4")

  		# @user = User.find(params[:user_id])
  		# @fluent_user = LanguagesUser.where(user: @user.id).where("level > 4")
  		# @nonfluent_user = LanguagesUser.where("level < 5").where(user: @user.id)
	end


	def match
		@language_id = LanguagesUser.find(params[:language_id])
		@languages_user = LanguagesUser.all
		@match = LanguagesUser.where("language_id = ? AND level < ? AND user_id != ?", params[:language_id], 5, current_user.id)
		
	end

	def manage
		@languages_user = LanguagesUser.find(params[:languages_user_id])
	end

	def view
		@user = User.find(params[:id])
		@fluent_languages = LanguagesUser.where(user: @user).where("level > 4")
  		@nonfluent_languages = LanguagesUser.where("level < 5").where(user: @user)
	end

	

end
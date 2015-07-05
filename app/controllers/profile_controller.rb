class ProfileController < ApplicationController

	def home
		@user = current_user
		@fluent_lang = LanguagesUser.where("user_id = '#{@user.id}'" && "level = '5'")
		@learning_lang = LanguagesUser.where("user_id = ? AND level < ?", current_user.id, 5)
		@matches = LanguagesUser.where("level < ? AND user_id != ?", 5, current_user.id)
		@language_id = LanguagesUser.find_by(@language_id)

		
	end


	def match
		@language_id = LanguagesUser.find(params[:language_id])
		@languages_user = LanguagesUser.all
		#match_params = params.require(:languages_user).permit(:language_id)
		#@language = params[:language_id]
		@match = LanguagesUser.where("language_id = ? AND level < ? AND user_id != ?", params[:language_id], 5, current_user.id)
		#@language_id = LanguagesUser.find_by(@language_id)
		#@match = LanguagesUser.find(params[:language_id])
		
		
		
		# @fluent_lang = LanguagesUser.where("user_id = '#{@user.id}'" && "level = '5'")
		# @learning_lang = LanguagesUser.where("user_id = '#{@user.id}'" && "level != '5'")

	
		
		
		 # if @fluent_lang != nil
		 # 	@language_id == @fluent_lang
		 			
		 # end

	end

	

end
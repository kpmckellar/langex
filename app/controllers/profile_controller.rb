class ProfileController < ApplicationController

	def home
		#@user = User.find(params[:user_id])
		@user = current_user
		@matches = LanguagesUser.where("level <= '4'" && "language_id = '1'" && "user_id != '#{@user.id}'")
	end

	

end
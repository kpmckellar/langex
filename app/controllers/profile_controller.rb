class ProfileController < ApplicationController

	def home
		#@user = User.find(params[:user_id])
		@user = current_user

	end

	

end
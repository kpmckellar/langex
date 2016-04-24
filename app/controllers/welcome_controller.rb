class WelcomeController < ApplicationController

	def index
		@user = current_user
		
		if user_signed_in?
			redirect_to home_path
		end
	end
end

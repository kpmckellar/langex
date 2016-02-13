class ProfileController < ApplicationController
	before_action :authenticate_user!

	def home
		@fluent_languages = LanguagesUser.where(user: current_user.id).where("level > 4")
  		@nonfluent_languages = LanguagesUser.where("level < 5").where(user: current_user.id)

  		@fluent_lang = LanguagesUser.where("level > 4")


  		@meetings = Meeting.where('meeting_time >= ? AND (requestor_id= ? OR requestee_id= ?)', Date.today, current_user,  current_user).limit(3).order('meeting_time asc')

  		@past_meetings = Meeting.where('meeting_time <= ? AND (requestor_id= ? OR requestee_id= ?)', Date.today, current_user,  current_user).limit(3).order('meeting_time asc')

  		#Something.find(:all, :order => "id desc", :limit => 5)

  		@meetings.each do |meeting|
  			if meeting.requestor_id == current_user.id
  				@meeting_user = User.find(meeting.requestee_id)
  			else
  				@meeting_user = User.find(meeting.requestor_id)
  			end
  		end
	end


	def match
	    @meetings = Meeting.all
	    @requestor = User.find(params[:requestor_id])
	    #@meetings = Meetings.where(requestor: @current_user || requestee: @current_user)
  	end
		
	def admin_view
		@users = User.all

		
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
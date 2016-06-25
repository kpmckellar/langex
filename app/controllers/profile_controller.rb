class ProfileController < ApplicationController
	before_action :authenticate_user!, except: [:waitlist]

	before_filter :approval_required, except: [:waitlist]


	def home
		@fluent_languages = LanguagesUser.where(user: current_user.id).where("level > 4")
  		@nonfluent_languages = LanguagesUser.where("level < 5").where(user: current_user.id)

  		@fluent_lang = LanguagesUser.where("level > 4")


  		@meetings = Meeting.where('meeting_time >= ? AND (requestor_id= ? OR requestee_id= ?)', Date.today, current_user,  current_user).limit(3).order('meeting_time asc')
  		#@meeting_requestor = User.find(@meetings.requestor_id)
  		#@meeting_requestor = User.find(@meeting_requestor)

  		@past_meetings = Meeting.where('meeting_time <= ? AND (requestor_id= ? OR requestee_id= ?)', Date.today, current_user,  current_user).order('meeting_time asc')

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

	def waitlist

		users = User.where(approved = nil)
		user_count = users.count
		@waitlist_count = (user_count + 250)

	    @id = session[:current_user_id]


	end

	private

	def approval_required
    if current_user.approved != true
      #redirect_to languages_user_new_path
    end
  end
	

end
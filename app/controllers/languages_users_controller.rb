class LanguagesUsersController < ApplicationController

	before_action :set_languages_user, only: [:show, :edit, :update, :destroy]

	def index
		@languages_user = LanguagesUser.all
	end


	def show
	end

	def new
		@languages_user = LanguagesUser.new
		#@user_id = current_user	
	end

	def edit
	end

	def create
		if user_signed_in?
		#@user_id = User.find_by_id(params[:id])
		#@languages_user = current_user.languages_user.build(params[:languages_user])
		#user_id = current_user
	   	@languages_user = LanguagesUser.new(languages_user_params)
	    #@languages_user.language_id = params[:languages_user][:language_id].to_i
	    #@user_id = user_id.to_i

			    respond_to do |format|
			      if @languages_user.save
			        format.html { redirect_to @languages_user, notice: 'Proficiency was successfully created.' }
			        format.json { render :show, status: :created, location: @languages_user }
			      else
			        format.html { render :new }
			        format.json { render json: @languages_user.errors, status: :unprocessable_entity }
			      end
			    end
			else
				puts 'You must be logged in'
				redirect_to new_languages_user_path
			end
	  end


	


	 private
    # Use callbacks to share common setup or constraints between actions.
    

    # Never trust parameters from the scary internet, only allow the white list through.

    def set_languages_user
      # @languages_user = LanguagesUser.find(params[:user_id, :languages_id, :level])
      @languages_user = LanguagesUser.find(params[:id])
      # @user_id = current_user
      # @user = current_user
    end

    def languages_user_params
    	#byebug
      params.require(:languages_user).permit(:language_id, :user_id, :level)
    end

	



    # Never trust parameters from the scary internet, only allow the white list through.
    
end
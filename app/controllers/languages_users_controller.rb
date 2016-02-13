class LanguagesUsersController < ApplicationController

	before_action :set_languages_user, only: [:show, :edit, :update, :destroy]

	def index
		@languages_user = LanguagesUser.all
	end


	def show

	end

	def sign_up

	end

	def new

		@languages_user = LanguagesUser.new
		#@user = current_user	
		
	end

	def edit
	end

	def create
		if user_signed_in?
		#@langauges_user.user_id = current_user.id if current_user
		#@user = current_user
		#languages_user_params.merge!(user_id: current_user)
			@languages_user = LanguagesUser.new(languages_user_params)
			@languages_user.user_id = current_user.id
  
		    respond_to do |format|
		      if @languages_user.save
		        format.html { redirect_to home_path, notice: 'Proficiency was successfully created.' }
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
	  
	def update
			respond_to do |format|
	      if @languages_user.update(languages_user_params)
	        format.html { redirect_to home_path, notice: 'Language was successfully updated.' }
	        format.json { render :show, status: :ok, location: @languages_user }
	      else
	        format.html { render :edit }
	        format.json { render json: @languages_user.errors, status: :unprocessable_entity }
	      end
	  end
	end	

	def destroy
		@languages_user.destroy
    		respond_to do |format|
      		format.html { redirect_to home_path, notice: 'Language was removed.' }
      		format.json { head :no_content }
		end
	end




	 private
    # Never trust parameters from the scary internet, only allow the white list through.
    def set_languages_user
      @languages_user = LanguagesUser.find(params[:id])
    end

    def languages_user_params
      params.require(:languages_user).permit(:language_id, :level, :user_id)
    end

	



    # Never trust parameters from the scary internet, only allow the white list through.
    
end
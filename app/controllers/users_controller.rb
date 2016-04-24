class UsersController < ApplicationController
	before_filter :authenticate_user!

  #validates :password, :password_confirmation, presence: true, on: :create

# Get roles accessible by the current user
  #----------------------------------------------------
  def accessible_roles
    @accessible_roles = Role.accessible_by(current_ability,:read)
  end
 
  # Make the current user object available to views
  #----------------------------------------
  def get_user
    @current_user = current_user
  end

 def index
# <<<<<<< HEAD
# 	 @users = User.accessible_by(current_ability, :index).limit(20)
# 	 respond_to do |format|
# =======
   @waitlist_users = User.where(approved: [false, nil])
   
   @users = User.accessible_by(current_ability, :index).limit(20)
   respond_to do |format|
# >>>>>>> waitlist
		format.json { render :json => @users }
		format.xml  { render :xml => @users }
	    format.html
	 end

   
   

 end
	
  # GET /users/new
  # GET /users/new.xml                                            
  # GET /users/new.json                                    HTML AND AJAX
  #-------------------------------------------------------------------
  def new


    respond_to do |format|
      format.json { render :json => @user }   
      format.xml  { render :xml => @user }
      format.html
    end
  end

  # GET /users/1
  # GET /users/1.xml                                                       
  # GET /users/1.json                                     HTML AND AJAX
  #-------------------------------------------------------------------
  def show
  	@user = User.find(params[:id])

    respond_to do |format|
      format.json { render :json => @user }
      format.xml  { render :xml => @user }
      format.html      
    end
 
    # rescue ActiveRecord::RecordNotFound
    #   respond_to_not_found(:json, :xml, :html)
  end

  # GET /users/1/edit                                                      
  # GET /users/1/edit.xml                                                      
  # GET /users/1/edit.json                                HTML AND AJAX
  #-------------------------------------------------------------------
  def edit
  	@user = User.find(params[:id])

    respond_to do |format|
      format.json { render :json => @user }   
      format.xml  { render :xml => @user }
      format.html
    end
 
    rescue ActiveRecord::RecordNotFound
      respond_to_not_found(:json, :xml, :html)
  end
 
  def edit_all
    @users = User.all
  end

  def update

    @user = User.find(params[:id])
    if user_params[:password].blank?
      user_params.delete(:password)
      user_params.delete(:password_confirmation)
    end


    successfully_updated = if needs_password?(@user, user_params)
                           @user.update(user_params)
                         else
                           @user.update_without_password(user_params)
                         end

    respond_to do |format|
      if successfully_updated
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
     
    end
   end

  # rescue ActiveRecord::RecordNotFound
  #   respond_to_not_found(:js, :xml, :html)
 

  

  # DELETE /users/1     
  # DELETE /users/1.xml
  # DELETE /users/1.json                                  HTML AND AJAX
  #-------------------------------------------------------------------
  def destroy
    @user.destroy!
 
    respond_to do |format|
      format.json { respond_to_destroy(:ajax) }
      format.xml  { head :ok }
      format.html { respond_to_destroy(:html) }      
    end
 
    rescue ActiveRecord::RecordNotFound
      respond_to_not_found(:json, :xml, :html)
    
  end


  


  # def update

  # @user = User.find(params[:id])
  # if user_params[:password].blank?
  #   user_params.delete(:password)
  #   user_params.delete(:password_confirmation)
  # end


  # successfully_updated = if needs_password?(@user, user_params)
  #                          @user.update(user_params)
  #                        else
  #                          @user.update_without_password(user_params)
  #                        end

  # respond_to do |format|
  #   if successfully_updated
  #     format.html { redirect_to @user, notice: 'User was successfully updated.' }
  #     format.json { head :no_content }
  #   else
  #     format.html { render action: 'edit' }
  #     format.json { render json: @user.errors, status: :unprocessable_entity }
  #   end
  # end


  # rescue ActiveRecord::RecordNotFound
  #   respond_to_not_found(:js, :xml, :html)
  # end

  # def update_all
  #   User.where(:id => params[:ids]).update_all(params[:user])
  #   redirect_to(users_path)
  # end
 
  def update_all
    params["user"].keys.each do |id|
      @user = User.find(id.to_i)
      @user.update_attributes(bulk_user_params(id))
    end
    redirect_to(users_path)
  end

  # POST /users
  # POST /users.xml         
  # POST /users.json                                      HTML AND AJAX
  #-----------------------------------------------------------------
  def create
    @user = User.new(params[:user])
 
    if @user.save
      respond_to do |format|
        format.json { render :json => @user.to_json, :status => 200 }
        format.xml  { head :ok }
        format.html { redirect_to :action => :index }
      end
    else
      respond_to do |format|
        format.json { render :text => "Could not create user", :status => :unprocessable_entity } # placeholder
        format.xml  { head :ok }
        format.html { render :action => :new, :status => :unprocessable_entity }
      end
    end
  end
 
# end
 


 ###Old Controllers###

# 	def admin
#     	@user = User.find params[:user_id]
#     	@user.toggle :admin if can? :manage, @user
#     	redirect_to @user 
#   	end

#   	# def index
#   	# 	@users = User.all
#   	# end

#   	# def edit

#   	# end

#  #  	def show
#  #  		@joined_on = @user.created_at.to_formatted_s(:short)
#  #  		if @user.current_sign_in_at
#  #    	@last_login = @user.current_sign_in_at.to_formatted_s(:short)
#  #  		else
#  #    	@last_login = "never"
#  #  		end
# 	# end


# def update_without_password(params, *options)
#     params.delete(:email)
#     super(params)
#   end




private
def needs_password?(user, params)
  params[:password].present?
end

# def update_without_password(user_params)
#   user.update_without_password(user_params)
# end

 def bulk_user_params(id)
  params.require(:user).fetch(id).permit( :first_name, :last_name, :email, :password, :password_confirmation, :role_id, :approved, :bio )
end

def user_params
# <<<<<<< HEAD
   		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :role_id, :approved)
# =======
#    		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :name, :role_id, :approved)
# >>>>>>> waitlist
end

end

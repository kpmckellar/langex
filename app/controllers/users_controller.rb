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
 	 #@users = User.all
	 @users = User.accessible_by(current_ability, :index).limit(20)
	 respond_to do |format|
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
 
  rescue ActiveRecord::RecordNotFound
    respond_to_not_found(:json, :xml, :html)
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

   # PUT /users/1
  # PUT /users/1.xml
  # PUT /users/1.json                                            HTML AND AJAX
  #----------------------------------------------------------------------------
  # def update
  #   if params[:user][:password].blank?
  #     [:password,:password_confirmation,:current_password].collect{|p| params[:user].delete(p) }
  #   else
  #     @user.errors[:base] << "The password you entered is incorrect" unless @user.valid_password?(params[:user][:current_password])
  #   end
 
  #   respond_to do |format|
  #     if @user.errors[:base].empty? and @user.update_attributes(params[:user])
  #       flash[:notice] = "Your account has been updated"
  #       format.json { render :json => @user.to_json, :status => 200 }
  #       format.xml  { head :ok }
  #       format.html { render :action => :edit }
  #     else
  #       format.json { render :text => "Could not update user", :status => :unprocessable_entity } #placeholder
  #       format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
  #       format.html { render :action => :edit, :status => :unprocessable_entity }
  #     end
  #   end
 
  # 
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


  rescue ActiveRecord::RecordNotFound
    respond_to_not_found(:js, :xml, :html)
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
 
end
 


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

def update_without_password(user_params)
  user.update_without_password(user_params)
end



def user_params
   		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :name, :role_id, :accepted)
end

# end
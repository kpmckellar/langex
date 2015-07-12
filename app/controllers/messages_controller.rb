class MessagesController < ApplicationController
  before_action :authenticate_user!
 
  # def new

  # end
  def new
  	@user = User.find_by(id: params[:to].to_i) if params[:to]
  	@chosen_recipient = User.find_by(id: params[:to].to_i) if params[:to]
  end
 
  def create
  	#receiver_id = User.where(id: params['recipients'])
  	recipients = User.find_by(id: params[:to].to_i) if params[:to]
    #recipients = User.where(id: params['recipients'])
    conversation = current_user.send_message(recipients, params[:message][:body], params[:message]).conversation
    flash[:success] = "Message has been sent!"
    redirect_to conversation_path(conversation)
  end
end
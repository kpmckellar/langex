class MessagesController < ApplicationController
  before_action :authenticate_user!
  def new
   #@user = User.find(params[:user])
    #@message = current_user.messages.new
  	#@user = User.find_by(id: params[:to].to_i) if params[:to]
  	#@chosen_recipient = User.find_by(id: params[:to].to_i) if params[:to]
  end

  def create
    recipients = User.where(id: params['recipients'])
    conversation = current_user.send_message(recipients, params[:message][:body], params[:message]).conversation
    flash[:success] = "Message has been sent!"
    redirect_to conversations_path(conversation)


    #@recipient = User.find(params[:user])
  	#receiver_id = User.where(id: params['recipients'])
  	#recipient = User.find(id: params[:to].to_i) if params[:to]
    #recipients = User.where(id: params['recipients'])
    #conversation = current_user.send_message(@recipients, params[:message][:body], params[:message]).conversation
    current_user.send_message(@recipient, params[:body], params[:message])
    flash[:success] = "Message has been sent!"
    #redirect_to :conversations
  end

 

  private

  # def set_message
  #   @recipient = User.find(params[:receiver_id])
  # end

 # def message_params
 #     params.require(:message).permit(:body)
 # end
end



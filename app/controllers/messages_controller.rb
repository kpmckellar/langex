class MessagesController < ApplicationController
  before_action :authenticate_user!
  def new
    @chosen_recipient = User.find_by(id: params[:to].to_i) if params[:to]
   
  end

  def create
    recipients = User.where(id: params['recipients'])
    conversation = current_user.send_message(recipients, params[:message][:body], params[:message]).conversation
    flash[:success] = "Message has been sent!"
    redirect_to conversations_path(conversation)

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



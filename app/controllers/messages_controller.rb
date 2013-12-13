class MessagesController < ApplicationController

  def create
    @message = Message.new(message_params)
    @message.from = current_user
    @message.save!
    flash[:notice] = "Your message has been sent"
    render :nothing => true
  end

  private
  def message_params
    params.require(:message).permit(:subject, :content, :to_id, :from_id, :reply_id)
  end
end

class MessagesController < ApplicationController

  def create
    @message = Message.new(message_params)
    @message.from = current_user
    @message.save!
    flash[:notice] = "Your message has been sent"
    redirect_to user_ad_path(:user_id => @message.ad.user.id, :id => @message.ad.id)
  end

  private
  def message_params
    params.require(:message).permit(:subject, :content, :to_id, :from_id, :reply_id, :ad_id)
  end
end

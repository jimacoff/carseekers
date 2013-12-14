class MessagesController < ApplicationController

  def create
    @message = Message.new(message_params)
    @message.from = current_user
    @message.save!
    flash[:notice] = "Your message has been sent"
    redirect_to user_ad_path(:user_id => @message.from_id, :id => @message.ad.id)
  end

  def show
    @message = Message.find(params[:id])
    @reply = Message.new
  end

  def destroy
    @message = Message.find(message_params[:id])
    @message.destroy
    respond_to do |format|
      format.js { render :json => { :message => @message } }
      format.html { render :nothing => :true }
    end
  end

  private
  def message_params
    params.require(:message).permit(:subject, :content, :to_id, :from_id, :reply_id, :ad_id, :id)
  end
end

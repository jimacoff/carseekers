require 'spec_helper'

describe MessagesController do

  before do
    @sender = User.make!
    sign_in @sender
    @receiver = User.make!
  end

  describe "A User sends a message to another user" do
    before do
      @message = Message.make
      @ad = Ad.make!
      @ad.messages << @message
      @ad.save!
      @receiver.ads << @ad
      @receiver.save!
      @valid_params = { :message => { :subject => @message.subject,
        :content => @message.content,
        :to_id => @receiver,
        :ad_id => @ad.id }
      }
      post :create, @valid_params
    end

    it "should have sent the message" do
      Message.first.subject.should eq(@message.subject)
    end

    it "should have a new received message" do
      @receiver.reload
      @receiver.received_messages.count.should eq(1)
      @receiver.received_messages.first.content.should eq(@message.content)
    end

    it "should have a new sent message" do
      @sender.reload
      @sender.sent_messages.count.should eq(1)
      @sender.sent_messages.first.content.should eq(@message.content)
    end
  end

  describe "A User deletes a message" do
    before do
      @message = Message.make!
      @valid_params = { :message => {
        :id => @message.id
      }}

      delete :destroy, @valid_params
    end

    it "should have deleted the message" do
      Message.count.should eq(0)
    end
  end

end

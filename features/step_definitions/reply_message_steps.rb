Given(/^that there is already another message$/) do
  @message = Message.make!
  @sender = User.make!
  @ad.car = Car.make!
  @ad = Ad.first
  @ad.car.make = Make.make!
  @ad.car.model = Model.make!
  @ad.bids.first.user_id = 1
  @ad.bids.first.save!
  @ad.save!
  @message.from_id = @sender.id
  @message.ad = @ad
  @message.save!
  @user.ads << @ad
  @user.received_messages << @message
  @user.save!
end

When(/^he clicks on the message subject$/) do
  click_link "Your Received Messages:"
  click_link @message.subject
end

Then(/^he should see the previous message$/) do
  expect(page).to have_content @message.subject
  expect(page).to have_content @message.content
end

Then(/^he should fill the reply form$/) do
  @reply = Message.make!
  fill_in "Subject", :with => @reply.subject
  fill_in "Content", :with => @reply.content
  click_button "Send Message"
end

Then(/^he should have that message as sent$/) do

  expect(page).to have_content "Notice: Your message has been sent"
  @sender.sent_messages.count.should eq(1)
  @sender.received_messages.count.should eq(1)
  @user.received_messages.count.should eq(1)
  Message.last.reply_id.should eq(@message.id)

end

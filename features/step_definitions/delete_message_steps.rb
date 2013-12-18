include Warden::Test::Helpers
Warden.test_mode!

Given(/^there is an user, an ad and a previous msg and he is on his profile$/) do
  @user = User.make!
  @ad = Ad.make!(:complete)
  @bid = Bid.make(:user_id => @user.id)
  @ad.bids << @bid
  @bid2 = Bid.first
  @bid2.user_id = @user.id
  @bid2.save!
  @message = Message.make!
  @sender = User.make!
  @message.from_id = @sender.id
  @message.save!
  @ad.messages << @message
  @ad.save!
  @user.received_messages << @message
  @user.ads << @ad
  @user.save!
  login_as(@user, :scope => :user)
  visit user_profiles_path(@user.id)
end

When(/^he deletes a message$/) do
  click_link "Your Received Messages:"
  click_link "Delete"
end

Then(/^he should not see that message anymore$/) do
  expect(page).not_to have_content @message.subject
end

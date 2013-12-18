Given(/^there is an user, an ad \(expired\) and a previous msg and he is on his profile$/) do
  @user = User.make!
  @ad = Ad.make!(:complete)
  @ad.ends = Time.now - 3.days
  @ad.save!
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

Then(/^he should have not access to the expired Ad$/) do
  expect(page).to have_content "Ad Sold or Expired"
end

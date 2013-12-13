Given(/^that there is another user already registered$/) do
  @receiver = User.make!
end

Given(/^that there is already an ad$/) do
  @ad = Ad.make!
  @make = Make.make!
  @model = Model.make!
  @car = Car.make!
  @car.make = @make
  @car.model = @model
  @ad.car = @car
  @receiver.ads << @ad
end

Given(/^that he is already on another user's ad$/) do
  visit user_ad_path(:user_id => @receiver.id, :id => @ad.id)
end

When(/^he fills in the message$/) do
  @message = Message.make!
  fill_in "Subject", :with => @message.subject
  fill_in "Content", :with => @message.content
  click_button "Send Message"
end

Then(/^he should see a notice as sent$/) do
  expect(page).to have_content "Notice: Your message has been sent"
end



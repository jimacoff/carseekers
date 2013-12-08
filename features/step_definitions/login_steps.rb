Given(/^the user is already registered$/) do
  @user = User.make!
end

Then(/^he fills in all the information needed for login$/) do
  fill_in "Email", :with => @user.email
  step 'he enters "password" into the "Password"'
end

Given(/^he clicks on "(.*?)"$/) do |link|
  click_link link
end

Then(/^he should be logged in$/) do
  expect(page).to have_content @user.nick
end

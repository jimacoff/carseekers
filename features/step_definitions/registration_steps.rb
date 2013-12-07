Given(/^that a user is on the registration page$/) do
  visit new_user_registration_path
end

When(/^(?:|s)he enters "(.*?)" into the "(.*?)"$/) do |input, input_field|
  fill_in input_field, :with => input
end

Given(/^he fills in all the information needed$/) do
  @user = User.make!
  step 'he enters "@user.email" into the "Email"'
  step 'he enters "password" into the "Password"'
  step 'he enters "password" into the "Password confirmation"'
end

When(/^he clicks on the "(.*?)" button$/) do |button|
  click_button button
end

Then(/^he should be registered on the system$/) do
  expect(User.count).to eq(1)
end

Then(/^he should be sent to the index page$/) do
  visit root_path
  expect(page).to have_content 'CarSeekers'
end

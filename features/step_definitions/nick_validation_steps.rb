Given(/^there is already another user registered with the nick that the user is going to choose$/) do
  @user = User.make!
end

Given(/^he fills in all the information needed with an already taken nick$/) do
  fill_in "Email", :with => @user.email
  fill_in "Nick", :with => @user.nick
  step 'he enters "password" into the "Password"'
  step 'he enters "password" into the "Password confirmation"'
end

Then(/^he should see one error "(.*?)"$/) do |error|
  expect(page).to have_content error
end

Given(/^the user is already signed in$/) do
  visit new_user_session_path
  fill_in "Email", :with => @user.email
  step 'he enters "password" into the "Password"'
  step 'he clicks on the "Sign in" button'
end

Given(/^that he is on his profile$/) do
  visit user_profiles_path(@user)
end

Then(/^he should see his personal information on it$/) do
  expect(page).to have_content @user.nick
  expect(page).to have_content @user.name
end

Then(/^he should be on the edit profile page$/) do
  expect(page.current_path).to eq(edit_user_profile_path(:user_id => @user.id, :id => @user.profile.id))
end

Then(/^he should see his previous registration data already filled in$/) do
  expect(page).to have_content @user.nick
  expect(page).to have_content @user.name
end

Then(/^he edits his personal information$/) do
  fill_in "Email", :with => "new@email.com"
  fill_in "Nick", :with => "MyNick"
  fill_in "Current password", :with => "password"
end

Then(/^he should see his new edited information on the edit page$/) do
  visit user_profiles_path(:user_id => @user.id)
  expect(page).to have_content "new@email.com"
  expect(page).to have_content "MyNick"
end

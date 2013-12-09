Given(/^that a user has a previously published Ad$/) do
  @ad = Ad.make!
  @user.ads << @ad
end

Given(/^he is on his profile page$/) do
  visit user_profiles_path(@user.id)
end

When(/^he clicks on Edit Ad$/) do
  click_link "Edit Ad"
end

Then(/^he should see all the Ad information ready to be edited$/) do
  page.should have_field('Title', with: @ad.title)
end

Then(/^he should edit the information$/) do
  @new_ad = Ad.make!
  fill_in "Title", :with => @new_ad.title
  click_button "Update Ad"
end

Then(/^he should see all the new information$/) do
  visit user_ad_path(:user_id => @user.id, :id => @ad.id)
  expect(page).to have_content @new_ad.title
end

Given(/^he is in the new Ad page$/) do
  visit new_user_ad_path(:user_id => @user.id)
end

When(/^he fills in the Ad information$/) do
  @ad = Ad.make!
  fill_in "Title", :with => @ad.title
  attach_file("ad[images_attributes][0][carphoto]", "#{Rails.root}/spec/fixtures/car.jpg")
  click_button "Publish"
end

Then(/^he should see all the info on his Ad$/) do
  have_xpath("//img[@src=\"/thumb_car.jpg\"]")
  expect(page).to have_content @ad.title
end

Then(/^he should see his new Ad on his profile page$/) do
  visit user_profiles_path(:user_id => @user.id)
  expect(page).to have_content @ad.title
end


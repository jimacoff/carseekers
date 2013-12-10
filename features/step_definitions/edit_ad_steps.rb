Given(/^that a user has a previously published Ad$/) do
  @image = Image.make!(:with_file)
  @ad = Ad.make!
  @user.ads << @ad
  @user.ads.first.images << @image
  @user.save!
end

Given(/^he is on his profile page$/) do
  visit user_profiles_path(@user.id)
end

When(/^he clicks on Edit Ad$/) do
  click_link "Edit Ad"
end

Given(/^he is on the edit page of the ad$/) do
  visit edit_user_ad_path(:user_id => @user.id, :id => @user.ads.first.id)
end


Then(/^he should see all the Ad information ready to be edited$/) do
  page.should have_field('Title', with: @user.ads.first.title)
end

Then(/^he should edit the information$/) do
  @new_ad = Ad.make!
  attach_file("ad[images_attributes][0][carphoto]", "#{Rails.root}/spec/fixtures/car2.jpg")
  fill_in "Title", :with => @new_ad.title
  check 'ad[images_attributes][5][_destroy]'
  click_button "Update Ad"
end

Then(/^he should see all the new information$/) do
  visit user_ad_path(:user_id => @user.id, :id => @ad.id)
  have_xpath("//img[@src=\"/thumb_car2.jpg\"]")
  expect(page).to have_content @new_ad.title
end

Then(/^the removed picture should not be there$/) do
  expect(page).should_not have_xpath("//img[@src=\"/thumb_car.jpg\"]")
end

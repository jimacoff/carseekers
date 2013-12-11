Given(/^there is make and model on the system$/) do
  Make.make!
  Model.make!
end

Given(/^he is in the new Ad page$/) do
  visit new_user_ad_path(:user_id => @user.id)
end

When(/^he fills in the Ad information$/) do
  @ad = Ad.make!
  select('Audi', :from => 'ad[car_attributes][make_id]')
  page.execute_script %Q{ $("#ad_car_attributes_model_id").append($("<option>").attr('value',1).text('TT')) }
  sleep(1)
  select('TT', :from => 'ad[car_attributes][model_id]')
  fill_in "Title", :with => @ad.title
  attach_file("ad[images_attributes][0][carphoto]", "#{Rails.root}/spec/fixtures/car.jpg")
  click_button "Publish"
end

Then(/^he should see all the info on his Ad$/) do
  save_and_open_page
  have_xpath("//img[@src=\"/thumb_car.jpg\"]")
  expect(page).to have_content @ad.title
end

Then(/^he should see his new Ad on his profile page$/) do
  visit user_profiles_path(:user_id => @user.id)
  expect(page).to have_content @ad.title
end


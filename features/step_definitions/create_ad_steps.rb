Given(/^there is make and model on the system$/) do
  @make = Make.make!
  @model = Model.make!
end

Given(/^he is in the new Ad page$/) do
  visit new_user_ad_path(:user_id => @user.id)
end

When(/^he fills in the Ad information$/) do
  @ad = Ad.make!
  @bid = Bid.make!
  @car_v2 = Car.make!(:v2)
  select('Audi', :from => 'ad[car_attributes][make_id]')
  page.execute_script %Q{ $("#ad_car_attributes_model_id").append($("<option>").attr('value',1).text('TT')) }
  sleep(1)
  select('TT', :from => 'ad[car_attributes][model_id]')
  select(@car_v2.engine, :from => 'ad[car_attributes][engine]')
  select(@car_v2.hp, :from => 'ad[car_attributes][hp]')
  select(@car_v2.fuel_type, :from => 'ad[car_attributes][fuel_type]')
  select(@car_v2.age, :from => 'ad[car_attributes][age]')
  select(@car_v2.style, :from => 'ad[car_attributes][style]')
  select(@car_v2.color, :from => 'ad[car_attributes][color]')
  fill_in "Title", :with => @ad.title
  fill_in "Starting price", :with => @bid.highest
  attach_file("ad[images_attributes][0][carphoto]", "#{Rails.root}/spec/fixtures/car.jpg")
  click_button "Publish"
end

Then(/^he should see all the info on his Ad$/) do
  have_xpath("//img[@src=\"/thumb_car.jpg\"]")
  expect(page).to have_content @ad.title
  expect(page).to have_content @car_v2.fuel_type
  expect(page).to have_content @car_v2.age
  expect(page).to have_content @car_v2.hp
  expect(page).to have_content @car_v2.color
  expect(page).to have_content @car_v2.engine
  expect(page).to have_content @bid.highest
end

Then(/^he should see his new Ad on his profile page$/) do
  visit user_profiles_path(:user_id => @user.id)
  expect(page).to have_content @ad.title
end


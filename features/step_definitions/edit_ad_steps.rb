Given(/^that a user has a previously published Ad$/) do
  @image = Image.make!(:with_file)
  @ad = Ad.make!
  @ad.car = Car.make!
  @ad.car.make = Make.make!
  @ad.car.model = Model.make!
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
  @car_v2 = Car.make!(:v2)
  select(@car_v2.engine, :from => 'ad[car_attributes][engine]')
  select(@car_v2.hp, :from => 'ad[car_attributes][hp]')
  select(@car_v2.fuel_type, :from => 'ad[car_attributes][fuel_type]')
  select(@car_v2.age, :from => 'ad[car_attributes][age]')
  select(@car_v2.style, :from => 'ad[car_attributes][style]')
  select(@car_v2.color, :from => 'ad[car_attributes][color]')
  attach_file("ad[images_attributes][0][carphoto]", "#{Rails.root}/spec/fixtures/car2.jpg")
  fill_in "Title", :with => @new_ad.title
  check 'ad[images_attributes][5][_destroy]'
  click_button "Update Ad"
end

Then(/^he should see all the new information$/) do
  have_xpath("//img[@src=\"/thumb_car2.jpg\"]")
  expect(page).to have_content @new_ad.title
  expect(page).to have_content @car_v2.fuel_type
  expect(page).to have_content @car_v2.age
  expect(page).to have_content @car_v2.hp
  expect(page).to have_content @car_v2.color
  expect(page).to have_content @car_v2.engine
end

Then(/^the removed picture should not be there$/) do
  expect(page).not_to have_xpath("//img[@src=\"/thumb_car.jpg\"]")
  expect(page).not_to have_content @ad.car.fuel_type
  expect(page).not_to have_content @ad.car.age
  expect(page).not_to have_content @ad.car.hp
  expect(page).not_to have_content @ad.car.color
  expect(page).not_to have_content @ad.car.engine
end

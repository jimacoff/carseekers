Given(/^there is already an expired Ad$/) do
  @car = Car.make!
  @expired = Ad.make!(:expired)
  @expired.car = @car
  @user.ads << @expired
end

When(/^he clicks on the Ad title to access the expired Ad$/) do
  click_link @expired.title
end

Then(/^he should have not access to the expired Ad$/) do
  expect(page).to_not have_content @expired.car.fuel_type
end

Then(/^he should see "(.*?)"$/) do |alert|
  expect(page).to have_content alert
end

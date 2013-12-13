When(/^he insert "(.*?)" as end date for the ad$/) do |date|
  @ad = Ad.make!
  @bid = Bid.make!
  @car_v2 = Car.make!(:v2)
  select('Audi', :from => 'ad[car_attributes][make_id]')
  page.execute_script %Q{ $("#ad_car_attributes_model_id").append($("<option>").attr('value',1).text('TT')) }
  sleep(3)
  select('TT', :from => 'ad[car_attributes][model_id]')
  select("30 Days", :from => 'ad[ends]')
  click_button "Publish"
end

Then(/^he should see "(.*?)" as remaining time for the ad$/) do |date|
  expect(page).to have_content date
end

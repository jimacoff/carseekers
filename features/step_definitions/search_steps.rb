Given(/^that there is already various ads$/) do
  @ad1 = Ad.make!(:complete)
  @ad2 = Ad.make!(:complete)
  @ad2.car.make.name = "Seat"
  @ad2.car.model.name = "Panda"
  @ad2.car.make.save!
  @ad2.car.model.save!
end

When(/^he selects the car to search$/) do
  select('Audi', :from => 'search[make_id]')
  page.execute_script %Q{ $("#search_model_id").append($("<option>").attr('value',1).text('TT')) }
  sleep(1)
  select('TT', :from => 'search[model_id]')
  click_button "Search"
end

Then(/^he should see a list of cars that matches the criteria$/) do
  expect(page).to have_content @ad1.title
  expect(page).to have_content @ad1.car.make.name
  expect(page).to have_content @ad1.car.model.name
end

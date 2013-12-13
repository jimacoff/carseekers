Given(/^there is already an active Ad$/) do
  @ad = Ad.make!
  @ad.active = true
  @ad.save!
end

Then(/^he should see just the active car$/) do
  expect(page).to have_content @ad.title
  expect(page).to_not have_content @expired.title
end

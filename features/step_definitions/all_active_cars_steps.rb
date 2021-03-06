Given(/^there is already an active Ad$/) do
  @ad = Ad.make!(:complete)
  @ad.active = true
  @bid = Bid.make!
  @bid.user_id = 1
  @bid.save!
  @expired = Ad.make!(:complete)
  @expired.ends = Time.now - 3.days
  @expired.save!
  @ad.bids << @bid
  @ad.save!
end

Then(/^he should see just the active car$/) do
  expect(page).to have_content @ad.title
  expect(page).to_not have_content @expired.title
end

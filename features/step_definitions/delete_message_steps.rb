When(/^he deletes a message$/) do
  click_link "Your Received Messages:"
  click_link "Delete"
end

Then(/^he should not see that message anymore$/) do
  expect(page).not_to have_content @message.subject
end

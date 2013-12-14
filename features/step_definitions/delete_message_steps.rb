When(/^he deletes a message$/) do
  save_and_open_page
  click_link "Your Received Messages:"
  click_link "Delete"
end

Then(/^he should not see that message anymore$/) do
  save_and_open_page
  expect(page).not_to have_content @message.subject
end

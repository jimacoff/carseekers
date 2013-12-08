Before do
  OmniAuth.config.test_mode = true
end

After do
  OmniAuth.config.test_mode = false
end

Given(/^that he is on the homepage$/) do
  visit root_path
end

Given(/^he has clicked on the "(.*?)" link$/) do |link|
  click_link link
end

Then(/^he should accept the requirements$/) do
  # mocked! -> user accepts requirements
end

Then(/^he should be then on the registration page$/) do
  expect(page.current_path).to eq(new_user_registration_path)
end

Then(/^he should see his email already filled in$/) do
  find_field('Name').value.should eq OmniAuth.config.mock_auth[:default].info.name
end

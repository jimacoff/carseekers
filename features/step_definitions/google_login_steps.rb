Before do
  OmniAuth.config.test_mode = true
end

After do
  OmniAuth.config.test_mode = false
end

Given(/^the user is already registered with its Google Account$/) do
  @user = User.make!
end

Then(/^he should accept the requirements if needed$/) do
  # mocked! -> user accepts requirements
end

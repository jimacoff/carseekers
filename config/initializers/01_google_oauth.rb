Carseekers::Application.configure do
  if Rails.env == "production"
    config.google_app_id = ENV["google_app_id"]
    config.google_app_secret = ENV["google_app_secret"]
  elsif Rails.env == "development"
    config.google_app_id = ENV["google_app_id"]
    config.google_app_secret = ENV["google_app_secret"]
  else
    google_oauth_secrets = YAML::load_file('config/google_oauth.yml')[Rails.env]
      config.google_app_id = ENV["google_app_id"] || google_oauth_secrets["google_app_id"]
      config.google_app_secret = ENV["google_app_secret"] || google_oauth_secrets["google_app_secret"]
  end
end


google_oauth_secrets = YAML::load_file('config/google_oauth.yml')[Rails.env]

Carseekers::Application.configure do
  config.google_app_id = google_oauth_secrets["google_app_id"]
  config.google_app_secret = google_oauth_secrets["google_app_secret"]
end

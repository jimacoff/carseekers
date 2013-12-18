if Rails.env.test? or Rails.env.cucumber?
  CarrierWave.configure do |config|
    config.enable_processing = false
  end
end

if Rails.env.test? or Rails.env.cucumber? or Rails.env.development?
  CarrierWave.configure do |config|
    config.storage = :file
  end
end

if Rails.env.production?
  CarrierWave.configure do |config|
    config.storage = :fog
    config.fog_credentials = {
      :provider               => 'AWS',                        # required
      :aws_access_key_id      => ENV['amazon_id'],                   # required
      :aws_secret_access_key  => ENV['amazon_key'],             # required
    }
    config.fog_directory  = 'carseekers'                     # required
  end
end
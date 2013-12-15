require 'clockwork'
require_relative 'boot'
require_relative 'environment'

module Clockwork
  handler do |job|
    puts "Running #{job}"
  end

  every(1.minutes, 'sending email'){ Ad.mail_to }
end
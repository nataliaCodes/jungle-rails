# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

#set up Capybara
require "capybara/rails"
require "capybara/rspec"
require "capybara/poltergeist"

Capybara.javascript_driver = :poltergeist
# Capybara.default_driver = :poltergeist
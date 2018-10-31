ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/reporters"  # for Colorized output
require 'vcr'
require "webmock/minitest"
#  For colorful output!
Minitest::Reporters.use!(
  Minitest::Reporters::SpecReporter.new,
  ENV,
  Minitest.backtrace_filter
)

VCR.configure do |config|
  #where to save the cassettes
  config.cassette_library_dir = "test/cassettes"
  #tie vcr and webmock together
  config.hook_into :webmock
  #match the verb, uri and body
  config.default_cassette_options = {
    record: :new_episodes,
    match_request_on: [:method, :uri, :body]
  }

  #hide your token so peopel on the internet do not see it
  #otherwise keys will save in your test files
  config.filter_sensitive_data('<TOKEN>') do
    ENV['APP_ID'],ENV['APP_KEY']
  end
end

# To add Capybara feature tests add `gem "minitest-rails-capybara"`
# to the test group in the Gemfile and uncomment the following:
# require "minitest/rails/capybara"

# Uncomment for awesome colorful output
# require "minitest/pride"

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  # Add more helper methods to be used by all tests here...
end

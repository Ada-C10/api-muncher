ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/reporters" # for Colorized output
# call VCR to record the interaction with the API and replay later
# saves unnecessary calls to API
require 'vcr'
require 'webmock/minitest'


#  For colorful output!
Minitest::Reporters.use!(
  Minitest::Reporters::SpecReporter.new,
  ENV,
  Minitest.backtrace_filter
)

# tell VCR how to run
VCR.configure do |config|
  # when recording tell VCR where to save the cassettes
  config.cassette_library_dir = 'test/cassettes'
  # tie VCR to webmock
  config.hook_into :webmock
  # set it to record new data
  config.default_cassette_options = {
      # only record if it sees something new
      record: :new_episodes,
      # tell what to match on if any of the below are
      # different from previous runs matches on VERB
      #  URI and BODY of http request
      match_requests_on: [:method, :uri, :body]
  }

  # CRITICAL FOR SECURITY !!!! HIDE TOKENS !!!!
  config.filter_sensitive_data('<MUNCHER_TOKEN>') do
    ENV["APPLICATION_KEYS"]
    ENV["APPLICATION_ID"]
  end
end
# To add Capybara feature tests add `gem "minitest-rails-capybara"`
# to the test group in the Gemfile and uncomment the following:
# require "minitest/rails/capybara"

# Uncomment for awesome colorful output
require "minitest/pride"

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  # Add more helper methods to be used by all tests here...
end

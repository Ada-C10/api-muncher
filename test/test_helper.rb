ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/reporters"
require "vcr"
require "webmock/minitest"

Minitest::Reporters.use!(
  Minitest::Reporters::SpecReporter.new,
  ENV,
  Minitest.backtrace_filter
)


# To add Capybara feature tests add `gem "minitest-rails-capybara"`
# to the test group in the Gemfile and uncomment the following:
# require "minitest/rails/capybara"

# Uncomment for awesome colorful output
# require "minitest/pride"

VCR.configure do |config|
  #where to save cassettes
  config.cassette_library_dir = 'test/cassettes'

  #tie vcr and webmock together
  config.hook_into :webmock

  #set it to record new data and match on the verb, uri, and body
  config.default_cassette_options = {
    record: :new_episodes,
    match_requests_on: [:method, :uri, :body]
  }

  config.filter_sensitive_data('<EDAMAM_KEY>') do
    ENV['EDAMAM_KEY']
  end

  config.filter_sensitive_data('<EDAMAM_ID>') do
    ENV['EDAMAM_ID']
  end
end

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  # Add more helper methods to be used by all tests here...
end

ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require 'vcr'
require 'webmock/minitest'

Minitest::Reporters.use!(
  Minitest::Reporters::SpecReporter.new,
  ENV,
  Minitest.backtrace_filter
)

VCR.configure do |config|
  # Where to save cassettes
  config.cassette_library_dir =
    'test/cassettes'

  # tie into this other tool called webmock
  config.hook_into :webmock

  # Set it to record new data and
  # Match on the VERB, URI and body
  config.default_cassette_options = {
    :record => :new_episodes,
    :match_requests_on => [:method, :uri, :body]
  }

  # Don't leave our Edamam key and id lying around in a cassette file.
  config.filter_sensitive_data("<EDAMAM_APPLICATION_ID>") do
    ENV['EDAMAM_APPLICATION_ID']
  end

  config.filter_sensitive_data("<EDAMAM_APPLICATION_KEYS>") do
    ENV['EDAMAM_APPLICATION_KEYS']
  end
end

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  # Add more helper methods to be used by all tests here...
end

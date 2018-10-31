ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require "minitest/rails"
require "minitest/reporters"  # for Colorized output
require 'vcr'
require 'webmock/minitest'


VCR.configure do |config|
  config.cassette_library_dir =
    "test/cassettes"

  config.hook_into :webmock

  config.default_cassette_options = {
    record: :new_episodes,
    match_request_on: [:method, :uri, :body]
  }

  config.filter_sensitive_data('<EDAMAM_ID>') do
    ENV['EDAMAM_ID']
  end

  config.filter_sensitive_data('<EDAMAM_KEY>') do
    ENV['EDAMAM_KEY']
  end

end

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

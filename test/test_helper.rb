ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/reporters"  # for Colorized output
#  For colorful output!
Minitest::Reporters.use!(
  Minitest::Reporters::SpecReporter.new,
  ENV,
  Minitest.backtrace_filter
)


# To add Capybara feature tests add `gem "minitest-rails-capybara"`
# to the test group in the Gemfile and uncomment the following:
# require "minitest/rails/capybara"

# Uncomment for awesome colorful output
require "minitest/pride"

VCR.configure do |config|
  #tell where to save the casettes
  config.cassette_library_dir = 'test/cassettes'

  # tie VCR and webmock together
  config.hook_into :webmock

  #very important
  config.default_cassette_options = {
    record: :new_episodes,   #record only if it is new
    match_requests_on: [:method, :uri, :body] #if same http verb, same url and same req body, replay an exisiting episode, if not record new episode
  }

  #hide api tokens with code below, can hide multiple items with multiple blocks
  config.filter_sensitive_data('<SLACK_TOKEN>') do
    ENV['SLACK_TOKEN']#if sees this, replaces with <SLACK_TOKEN>
  end

end

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  # Add more helper methods to be used by all tests here...
  def setup
  # !!!! Once you have enabled test mode, all requests to OmniAuth will be short circuited to use the mock authentication hash.
  # A request to /auth/provider will redirect immediately to /auth/provider/callback !!!!
    OmniAuth.config.test_mode = true
  end

  def mock_auth_hash(user)
    return {
      provider: user.provider,
      uid: user.uid,
      info: {
        email: user.email,
        name: user.name
      }
    }
  end

  def perform_login(user)
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(mock_auth_hash(user))
    get auth_callback_path(:github)
  end
end

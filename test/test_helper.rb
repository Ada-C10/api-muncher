ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/reporters"  # for Colorized output
#  For colorful output!
require "vcr"
require 'webmock/minitest'

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

############# add vcr ###########
#this is where you tell VCR how to behave
VCR.configure do |config|
  #tell it where to save the cassettes
  config.cassette_library_dir =
  'test/cassettes'

  #Tie VCR and webmock together
  config.hook_into :webmock


  # set it to record new data and
  #match on the VERB, URI and body
  config.default_cassette_options = {
    record: :new_episodes,  #only record if it sees something new
    #if these are all the same it just plays the episode if theyre different all all it'll record  new
    match_requests_on: [:method, :uri, :body] #header body method (get or post method)
  }
  # but DONT record sensitive data like our slack token
  #replace it with ENV['SLACK_TOKEN'] so that its hidden
  config.filter_sensitive_data('<APP_ID>') do
    ENV['APP_ID']
  end

  config.filter_sensitive_data('<APP_KEY>') do
    ENV['APP_KEY']
  end
  
end




class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  # Add more helper methods to be used by all tests here...
end

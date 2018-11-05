require 'simplecov'
SimpleCov.start

ENV["RAILS_ENV"] = "test" # what's this?

require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/reporters"  # for Colorized output

require "vcr"
require 'webmock/minitest'

#  For colorful output!
Minitest::Reporters.use!(
  Minitest::Reporters::SpecReporter.new,
  ENV,
  Minitest.backtrace_filter
)

VCR.configure do |config|
  config.cassette_library_dir = 'test/cassettes' # folder where casettes will be located
  config.hook_into :webmock # tie into this other tool called webmock
  config.default_cassette_options = {
    :record => :new_episodes,    # record new data when we don't have it yet
    :match_requests_on => [:method, :uri, :body] # The http method, URI and body of a request all need to match
  }
  # Don't leave our Edamam tokens lying around in a cassette file.
  config.filter_sensitive_data("<EDAMAM_APP_ID>") do
    ENV['EDAMAM_APP_ID']
  end
  config.filter_sensitive_data("<EDAMAM_APP_KEY>") do
    ENV['EDAMAM_APP_KEY']
  end
end

# To add Capybara feature tests add `gem "minitest-rails-capybara"`
# to the test group in the Gemfile and uncomment the following:
# require "minitest/rails/capybara"

# Uncomment for awesome colorful output
# require "minitest/pride"

RECIPE_REQUIRED_ARGS = [:label, :recipe_uri, :source, :source_uri, :ingredient_lines]
RECIPE_REQUIRED_VALUES = ["some recipe", "http://recipe_uri", "source", "http://source_uri", ["ingredients"]]
RECIPE_REQUIRED_ARGS_HASH = {:label=>"some recipe", :recipe_uri=>"http://recipe_uri", :source=>"source", :source_uri=>"http://source_uri", :ingredient_lines=>["ingredients"]}

RECIPE_OPT_ARGS = [:image_uri, :recipe_yield, :total_time, :health_labels]
RECIPE_OPT_VALUES = ["http://image_uri", "yields 100", 30, ["labels"]]
EDAMAM_ID_PREFIX = "http://www.edamam.com/ontologies/edamam.owl#"

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  # Add more helper methods to be used by all tests here...
end

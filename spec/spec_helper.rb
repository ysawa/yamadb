$LOADED_FEATURES.push File.expand_path(__FILE__)
def require(path)
  path = File.expand_path(path) if path =~ %r{^[./]}
  super path
end
require 'rubygems'
require 'spork'

Spork.prefork do
  # Loading more in this block will cause your tests to run faster. However,
  # if you change any configuration or code from libraries loaded here, you'll
  # need to restart spork for it take effect.

end

Spork.each_run do
  # This code will be run each time you run your specs.

end

# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

Mongoid.configure do |config|
  config.autocreate_indexes = true
end

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  # config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.before(:each) do
    FakeWeb.allow_net_connect = false
    Mongoid.database.collections.each do |collection|
      unless collection.name =~ /^system\./
        collection.remove
      end
    end
  end

  config.after(:each) do
    # remove all tmp files created by CarrierWave
    tmp_directory = File.join(Rails.root, "public/uploads/tmp")
    FileUtils.rm_rf(tmp_directory) if File.directory?(tmp_directory)
    FakeWeb.clean_registry
  end

  # To test features using authentication
  config.include Devise::TestHelpers, :type => :controller
  config.include DeviseAuthenticationHelper, :type => :controller

  # == Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr
  config.mock_with :rspec

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  # config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  # config.use_transactional_fixtures = true
end

# imported capybara gems
require 'capybara'
require 'capybara/rspec'

RSpec.configure do |config|

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  # configured capybara inside rspec
  config.include Capybara::DSL
  
  # can use inside before(:each)
  config.before(:example) do 
    page.current_window.resize_to(1280, 800)
  end
end

# Configured the default driver
Capybara.configure do |config|
  config.default_driver = :selenium_chrome
  config.default_max_wait_time = 6
  config.app_host = 'https://training-wheels-protocol.herokuapp.com'
end
require'simplecov'
require 'capybara/poltergeist'
SimpleCov.start 'rails' do
  add_filter "app/controllers/users/"
  add_filter "app/mailers/"
end
Capybara.javascript_driver = :poltergeist

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.after :all do
    ActiveRecord::Base.subclasses.each(&:delete_all)
  end
end

require 'rspec'
require 'webmock/rspec'
require 'vcr'
require 'dotenv/load'
require 'ola_maps'
require 'pry'

Dir["./spec/support/**/*.rb"].sort.each { |f| require f }

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.before(:each) do
    stub_request(:post, "https://account.olamaps.io/realms/olamaps/protocol/openid-connect/token").
      to_return(status: 200, body: { access_token: "fake_token" }.to_json, headers: { 'Content-Type' => 'application/json' })
  end
end

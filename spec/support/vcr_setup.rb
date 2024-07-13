require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = 'spec/vcr_cassettes'
  config.hook_into :webmock
  config.configure_rspec_metadata!

  config.filter_sensitive_data('<API_KEY>') { ENV['API_KEY'] }
  config.filter_sensitive_data('<CLIENT_ID>') { ENV['CLIENT_ID'] }
  config.filter_sensitive_data('<CLIENT_SECRET>') { ENV['CLIENT_SECRET'] }
  config.filter_sensitive_data('<X_REQUEST_ID>') { SecureRandom.uuid }
  config.filter_sensitive_data('<X_CORRELATION_ID>') { SecureRandom.uuid }

  # Optionally, you can include headers to be recorded in cassettes
  config.default_cassette_options = { record: :new_episodes }
  config.before_record do |i|
    i.request.headers['X-Request-Id'] = ['<X_REQUEST_ID>']
    i.request.headers['X-Correlation-Id'] = ['<X_CORRELATION_ID>']
  end
end

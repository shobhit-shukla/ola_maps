require 'spec_helper'

RSpec.describe OlaMaps::Client do
  let(:client) { OlaMaps::Client.new(api_key: ENV['API_KEY'], client_id: ENV['CLIENT_ID'], client_secret: ENV['CLIENT_SECRET']) }

  describe '#autocomplete', :vcr do
    it 'returns autocomplete suggestions' do
      response = client.autocomplete('kempe')

      puts "Request URL: #{response.env.url}"  # Print the request URL
      puts "Response Status: #{response.status}"  # Print the response status
      puts "Response Body: #{response.body}"  # Print the response body

      expect(response.status).to eq(200)
      expect(response.body['predictions']).not_to be_empty
    end
  end

  describe '#geocode', :vcr do
    it 'returns geocoded address' do
      response = client.geocode('Bangalore')

      puts "Request URL: #{response.env.url}"  # Print the request URL
      puts "Response Status: #{response.status}"  # Print the response status
      puts "Response Body: #{response.body}"  # Print the response body

      expect(response.status).to eq(200)
      expect(response.body['geocodingResults']).not_to be_empty
    end
  end

  describe '#reverse_geocode', :vcr do
    it 'returns reverse geocoded address' do
      response = client.reverse_geocode('12.931316595874005,77.61649243443775')

      puts "Request URL: #{response.env.url}"  # Print the request URL
      puts "Response Status: #{response.status}"  # Print the response status
      puts "Response Body: #{response.body}"  # Print the response body

      expect(response.status).to eq(200)
      expect(response.body['results']).not_to be_empty
    end
  end
end

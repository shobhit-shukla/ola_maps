require 'faraday'
require 'securerandom'
require 'json'

module OlaMaps
  class Client
    BASE_URL = 'https://api.olamaps.io'

    def initialize(api_key: nil, client_id: nil, client_secret: nil)
      @api_key = api_key
      @client_id = client_id
      @client_secret = client_secret
    end

    def autocomplete(input, origin: nil, location: nil, radius: nil, strictbounds: nil)
      query = { input: input, api_key: @api_key }
      query[:origin] = origin if origin
      query[:location] = location if location
      query[:radius] = radius if radius
      query[:strictbounds] = strictbounds if strictbounds

      get('/places/v1/autocomplete', query)
    end

    def geocode(address, bounds: nil, language: 'English')
      query = { address: address, api_key: @api_key }
      query[:bounds] = bounds if bounds
      query[:language] = language

      get('/places/v1/geocode', query)
    end

    def reverse_geocode(latlng)
      query = { latlng: latlng, api_key: @api_key }

      get('/places/v1/reverse-geocode', query)
    end

    private

    def get(path, params)
      connection.get(path, params) do |req|
        req.headers = default_headers
      end
    end

    def connection
      @connection ||= Faraday.new(url: BASE_URL) do |faraday|
        faraday.request :url_encoded
        faraday.response :json, content_type: /\bjson$/
        faraday.adapter Faraday.default_adapter
      end
    end

    def default_headers
      headers = {}
      headers['X-Request-Id'] = SecureRandom.uuid
      headers['X-Correlation-Id'] = SecureRandom.uuid
      headers['Authorization'] = "Bearer #{get_token}" if @client_id && @client_secret
      headers
    end

    def get_token
      response = Faraday.post(
        'https://account.olamaps.io/realms/olamaps/protocol/openid-connect/token',
        {
          grant_type: 'client_credentials',
          client_id: @client_id,
          client_secret: @client_secret,
          scope: 'openid olamaps'
        }
      )
      JSON.parse(response.body)['access_token']
    end
  end
end

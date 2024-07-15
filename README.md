# Ola Maps

A Ruby gem for interacting with the Ola Maps API, providing a simple interface for location-based services like autocomplete, geocoding, and reverse geocoding.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ola_maps'
```

Then, execute:

```ruby
$ bundle install
```

If bundler is not being used to manage dependencies, install the gem by executing:

```ruby
$ gem install 'ola_maps'
```

## Configuration

Before using the gem, set up your environment variables in a .env file:

```ruby
API_KEY=your_api_key
CLIENT_ID=your_client_id
CLIENT_SECRET=your_client_secret
```

## API Key
Get your API key from here:

https://maps.olakrutrim.com/

for details refer:

https://maps.olakrutrim.com/docs


## Usage

Here's how to use the `OlaMaps` gem:

```ruby
require 'dotenv/load'
require 'ola_maps'

client = OlaMaps::Client.new(
  api_key: ENV['API_KEY']
)

# Autocomplete
autocomplete_response = client.autocomplete('kempe')
puts autocomplete_response.body

# Geocode
geocode_response = client.geocode('Bangalore')
puts geocode_response.body

# Reverse Geocode
reverse_geocode_response = client.reverse_geocode('12.931316595874005,77.61649243443775')
puts reverse_geocode_response.body

```

## API Methods

### `#autocomplete(input, origin: nil, location: nil, radius: nil, strictbounds: nil)`

Returns autocomplete suggestions based on the input string.

- **Parameters:**
  - `input`: The input string for autocomplete.
  - `origin`: (Optional) The origin location.
  - `location`: (Optional) The location to bias the results.
  - `radius`: (Optional) The radius within which to return results.
  - `strictbounds`: (Optional) If true, restrict results to the specified area.

### `#geocode(address, bounds: nil, language: 'English')`

Returns geocoded address information.

- **Parameters:**
  - `address`: The address to geocode.
  - `bounds`: (Optional) The bounds within which to search.
  - `language`: (Optional) The language for the response (default is 'English').

### `#reverse_geocode(latlng)`

Returns reverse geocoded address information for a given latitude and longitude.

- **Parameters:**
  - `latlng`: The latitude and longitude in the format `lat,lng`.

## Running Tests

To run the tests for this gem, ensure you have the required environment variables set in your .env file, then execute:

```ruby
bundle exec rspec
```

## Contributing

1. Fork it (https://github.com/shobhit-shukla/ola_maps/fork)
2. Create your feature branch (`git checkout -b feature/YourFeature`)
3. Commit your changes (`git commit -m 'Add some feature'`)
4. Push to the branch (`git push origin feature/YourFeature`)
5. Create a new Pull Request

Bug reports and pull requests are welcome on GitHub at [ola_maps](https://github.com/shobhit-shukla/ola_maps). This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/shobhit-shukla/ola_maps/blob/main/CODE_OF_CONDUCT.md).


## License

This gem is available as open-source under the terms of the MIT License.

### Customization

Feel free to modify sections like the installation instructions or API method descriptions to match your specific implementation details.

## Code of Conduct

Everyone interacting in the OlaMaps project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/ola_maps/blob/main/CODE_OF_CONDUCT.md).

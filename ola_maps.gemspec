require_relative "lib/ola_maps/version"

Gem::Specification.new do |spec|
  spec.name = "ola_maps"
  spec.version = OlaMaps::VERSION
  spec.authors = ["Shobhit"]
  spec.email = ["shobits001@outlook.com"]

  spec.summary = "A Ruby wrapper for the Ola Maps API."
  spec.description = "Provides an easy interface for interacting with the Ola Maps API."
  spec.homepage = "https://github.com/shobhit-shukla/ola-maps-ruby"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.5.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/shobhit-shukla/ola-maps-ruby"
  spec.metadata["changelog_uri"] = "https://github.com/shobhit-shukla/ola-maps-ruby"

  spec.files = Dir["lib/**/*", "README.md"]

  spec.bindir = "exe"
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "faraday", "~> 2.0"
  spec.add_runtime_dependency "securerandom"
  spec.add_runtime_dependency "dotenv", "~> 2.7"

  spec.add_development_dependency "rspec", "~> 3.10"
  spec.add_development_dependency "webmock", "~> 3.14"
  spec.add_development_dependency "vcr", "~> 6.0"
  spec.add_development_dependency "pry", "~> 0.14.0"
end

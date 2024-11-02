# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name          = 'rb-gravatar'
  s.version       = '1.0.7'
  s.date          = '2024-02-11'
  s.summary       = "A lightweight Gravatar tag helper library"
  s.description   = "A Ruby gem for creating Gravatar image URLs and HTML tags with options for size and default image parameters. Provides an easy-to-use interface to generate and embed Gravatar images in web applications."
  s.authors       = ["Sean Nieuwoudt"]
  s.email         = 'sean@isean.co.za'
  s.files         = Dir.glob("lib/**/*.rb") + %w[README.md LICENSE]
  s.homepage      = 'https://github.com/sn/ruby-gravatar'
  s.license       = "GPL-3.0-or-later"

  s.required_ruby_version = '>= 2.7'

  # Development dependencies for testing and development tasks
  s.add_development_dependency 'minitest', '~> 5.25'
  s.add_development_dependency 'rake', '~> 13.2.1'
  s.add_development_dependency 'bundler', '~> 2.3'

  # Add metadata for better gem discoverability
  s.metadata = {
    "source_code_uri" => "https://github.com/sn/ruby-gravatar",
    "changelog_uri"   => "https://github.com/sn/ruby-gravatar/blob/main/CHANGELOG.md",
    "documentation_uri" => "https://rubydoc.info/gems/rb-gravatar",
    "bug_tracker_uri" => "https://github.com/sn/ruby-gravatar/issues"
  }
end

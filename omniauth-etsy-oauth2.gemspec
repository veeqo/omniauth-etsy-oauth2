# frozen_string_literal: true

require_relative 'lib/omniauth/etsy/version'

Gem::Specification.new do |spec|
  spec.name          = 'omniauth-etsy-oauth2'
  spec.version       = Omniauth::Etsy::VERSION
  spec.authors       = ['Ulan Djamanbalaev']
  spec.email         = ['udjamanbalaev@gmail.com']

  spec.summary       = 'Etsy OAuth2 strategy for OmniAuth 1.0'
  spec.homepage      = 'https://github.com/veeqo/omniauth-etsy-oauth2'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/veeqo/omniauth-etsy-oauth2'
  spec.metadata['changelog_uri'] = 'https://github.com/veeqo/omniauth-etsy-oauth2/blob/master/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path('..', __FILE__)) do
    %x(git ls-files -z).split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'omniauth', '~> 1.9.1'
  spec.add_dependency 'omniauth-oauth2', '~> 1.4'

  spec.add_development_dependency 'rubocop-shopify', '~> 2.2.0'
  spec.add_development_dependency 'rake', '~> 12'
  spec.add_development_dependency 'rspec', '~> 3.5'
end

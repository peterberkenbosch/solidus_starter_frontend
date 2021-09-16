# frozen_string_literal: true

require_relative 'lib/solidus_starter_frontend/version'

Gem::Specification.new do |spec|
  spec.name = 'solidus_starter_frontend'
  spec.version = SolidusStarterFrontend::VERSION
  spec.authors = ['Nebulab']
  spec.email = 'hello@nebulab.it'

  spec.summary = 'A starter storefront for the Solidus e-commerce project.'
  spec.description = 'A modern, minimal, semantic and easy to extend frontend codebase for a more efficient bootstrapping experience with Solidus'
  spec.homepage = 'https://github.com/nebulab/solidus_starter_frontend/#readme'
  spec.license = 'BSD-3-Clause'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/nebulab/solidus_starter_frontend'
  spec.metadata['changelog_uri'] = 'https://github.com/nebulab/solidus_starter_frontend/releases'

  spec.required_ruby_version = Gem::Requirement.new('~> 2.5')

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  files = Dir.chdir(__dir__) { `git ls-files -z`.split("\x0") }

  spec.files = files.grep_v(%r{^(test|spec|features)/})
  spec.test_files = files.grep(%r{^(test|spec|features)/})
  spec.bindir = "exe"
  spec.executables = files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end

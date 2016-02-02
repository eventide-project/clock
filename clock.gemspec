# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name = 'clock'
  s.summary = 'Clock interface with support for dependency configuration for real and null object implementations'
  s.version = '0.0.3.1'
  s.description = ' '

  s.authors = ['Obsidian Software, Inc']
  s.email = 'opensource@obsidianexchange.com'
  s.homepage = 'https://github.com/obsidian-btc/clock'
  s.licenses = ['MIT']

  s.require_paths = ['lib']
  s.files = Dir.glob('{lib}/**/*')
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>= 2.2.3'

  s.add_runtime_dependency 'tzinfo'
  s.add_runtime_dependency 'naught'

  s.add_development_dependency 'test_bench'
end

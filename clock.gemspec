# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name = 'evt-clock'
  s.summary = 'Clock interface with support for UTC and local timezones, timezone coercion, and dependency substitution'
  s.version = '2.4.0.0'
  s.description = ' '

  s.authors = ['The Eventide Project']
  s.email = 'opensource@eventide-project.org'
  s.homepage = 'https://github.com/eventide-project/clock'
  s.licenses = ['MIT']

  s.require_paths = ['lib']
  s.files = Dir.glob('{lib}/**/*')
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>= 2.3.3'

  s.add_runtime_dependency 'evt-mimic'

  s.add_development_dependency 'test_bench'
end

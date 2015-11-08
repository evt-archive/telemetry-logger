# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name = 'telemetry-logger'
  s.version = '0.1.0'
  s.summary = 'Logging to STDERR with coloring and levels of severity'
  s.description = ' '

  s.authors = ['Obsidian Software, Inc']
  s.email = 'opensource@obsidianexchange.com'
  s.homepage = 'https://github.com/obsidian-btc/error_data'
  s.licenses = ['MIT']

  s.require_paths = ['lib']
  s.files = Dir.glob('{lib}/**/*')
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>= 2.2.3'

  s.add_runtime_dependency 'clock', '~> 0'
  s.add_runtime_dependency 'dependency', '~> 0'

  s.add_runtime_dependency 'rainbow'
end

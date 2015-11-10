ENV['CONSOLE_DEVICE'] ||= 'stdout'
ENV['LOG_LEVEL'] ||= 'obsolete'
ENV['LOG_COLOR'] ||= 'on'
ENV['LOG_OPTIONAL'] ||= 'on'

puts RUBY_DESCRIPTION

require_relative '../init.rb'

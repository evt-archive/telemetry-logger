require_relative 'test_init'

Telemetry::Logger::AdHoc.activate

__logger.focus 'This is an ad hoc focus message'

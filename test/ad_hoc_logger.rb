require_relative 'test_init'

Telemetry::Logger::AdHoc.activate

__logger.info 'This is an ad hoc info'

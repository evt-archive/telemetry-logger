require_relative 'test_init'

logger = Telemetry::Logger.get self
logger.info 'Telemetry::Logger.get'

logger = Telemetry::Logger.register self
logger.info 'Telemetry::Logger.register'

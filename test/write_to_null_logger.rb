require_relative 'test_init'

module WriteToNullLogger
  class Example
    dependency :logger, Telemetry::Logger

    def self.build
      instance = new
      instance
    end

    def obsolete
      logger.obsolete "This obsolete message should not be written"
    end

    def data
      logger.data "This data message should not be written"
    end

    def trace
      logger.trace "This trace message should not be written"
    end

    def debug
      logger.debug "This debug message should not be written"
    end

    def info
      logger.info "This info message should not be written"
    end

    def pass
      logger.pass "This pass message should not be written"
    end

    def fail
      logger.fail "This fail message should not be written"
    end

    def focus
      logger.focus "This focus message should not be written"
    end

    def warn
      logger.warn "This warn message should not be written"
    end

    def error
      logger.error "This error message should not be written"
    end

    def fatal
      logger.fatal "This fatal message should not be written"
    end
  end
end

e = WriteToNullLogger::Example.build
e.obsolete
e.data
e.trace
e.debug
e.info
e.pass
e.fail
e.warn
e.error
e.fatal

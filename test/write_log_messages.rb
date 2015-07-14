require_relative 'test_init'

module WriteLogMessages
  class Example
    attr_accessor :logger

    def self.build
      instance = new
      Telemetry::Logger.configure instance
      instance
    end

    def data
      logger.data "This is a data"
    end

    def trace
      logger.trace "This is a trace"
    end

    def debug
      logger.debug "This is a debug"
    end

    def info
      logger.info "This is an info"
    end

    def pass
      logger.pass "This is a pass"
    end

    def fail
      logger.fail "This is a fail"
    end

    def warn
      logger.warn "This is a warn"
    end

    def error
      logger.error "This is an error"
    end

    def fatal
      logger.fatal "This is a fatal"
    end
  end
end

e = WriteLogMessages::Example.build
e.data
e.trace
e.debug
e.info
e.pass
e.fail
e.warn
e.error
e.fatal

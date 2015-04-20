require_relative 'test_init'

class Example
  dependency :logger, Logger

  def self.build
    instance = new
    instance
  end

  def trace
    logger.trace "This is a trace"
  end

  def data
    logger.data "This is a data"
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

  def nonsense
    begin
      logger.nonsense "This raised"
    rescue NoMethodError
      puts "This raised an error correctly"
    ensure
      puts "An error should have been raised and rescued"
    end
  end
end

e = Example.build
e.trace
e.data
e.debug
e.info
e.pass
e.fail
e.warn
e.error
e.fatal
e.nonsense

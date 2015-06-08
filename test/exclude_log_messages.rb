require_relative 'test_init'

class ExcludeLogMessages
  attr_accessor :logger

  def self.build
    instance = new
    Telemetry::Logger.configure instance
    instance
  end

  def initialize
    ENV['LOG_EXCLUDE'] = "should be excluded|AlsoExcluded"
  end

  def log
    logger.debug message
  end

  class Excluded < ExcludeLogMessages
    def message
      "This should be excluded because of the message content"
    end
  end

  class AlsoExcluded < ExcludeLogMessages
    def message
      "This should also be excluded because of the class name"
    end
  end

  class Included < ExcludeLogMessages
    def message
      "This should not be excluded"
    end
  end
end

excluded = ExcludeLogMessages::Excluded.build
excluded.log

also_excluded = ExcludeLogMessages::AlsoExcluded.build
also_excluded.log

included = ExcludeLogMessages::Included.build
included.log

ENV['LOG_EXCLUDE'] = nil

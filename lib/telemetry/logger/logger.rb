module Telemetry
  module Logger
    extend self

    def build(subject, implementation=nil)
      implementation ||= Defaults.implementation
      logger = implementation.build(subject)
      logger
    end
    alias :get :build
    alias :register :build

    def configure(receiver, implementation=nil)
      logger = get(receiver, implementation)
      receiver.logger = logger
      logger
    end

    def self.debug(message)
      write message
    end

    def self.write(message, level=nil, subject=nil, implementation=nil)
      level ||= :debug
      subject ||= '***'

      logger = get subject, implementation

      logger.write_message level, message
    end

    module Defaults
      def self.implementation
        ConsoleLogger
      end
    end
  end
end

class Telemetry
  module Logger
    module Access
      def self.included(cls)
        cls.class_exec do
          dependency :logger, Telemetry::Logger

          def logger
            Logger.configure self
            @logger
          end
        end
      end
    end
  end
end

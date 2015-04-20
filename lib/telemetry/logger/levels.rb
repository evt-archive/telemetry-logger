module Telemetry
  module Logger
    module Levels
      def levels
        [:trace, :data, :debug, :info, :pass, :fail, :warn, :error, :fatal]
      end

      def trace(message)
        write_message('trace', message) if write?(0)
      end

      def data(message)
        write_message('data', message) if write?(1)
      end

      def debug(message)
        write_message('debug', message) if write?(2)
      end

      def info(message)
        write_message('info', message) if write?(3)
      end

      def pass(message)
        write_message('pass', message) if write?(4)
      end

      def fail(message)
        write_message('fail', message) if write?(5)
      end

      def warn(message)
        write_message('warn', message) if write?(6)
      end

      def error(message)
        write_message('error', message) if write?(7)
      end

      def fatal(message)
        write_message('fatal', message) if write?(8)
      end

      def write_message(level, message)
        implementer.write "[#{implementer.clock.iso8601}] #{name} #{level.upcase}: #{message}"
      end

      def write?(level_ordinal)
        level_ordinal >= level_number
      end

      def implementer
        self
      end
    end
  end
end

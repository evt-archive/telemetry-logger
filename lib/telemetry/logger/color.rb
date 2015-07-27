module Telemetry
  module Logger
    module Color
      extend self

      def apply(level, message)
        level_sym = level.to_sym

        if respond_to? level_sym
          send level_sym, message
        else
          message
        end
      end

      def metadata(text)
        Rainbow(text).white
      end

      def data(message)
        Rainbow(message).cyan
      end

      def trace(message)
        Rainbow(message).white
      end

      def info(message)
        Rainbow(message).green
      end

      def pass(message)
        Rainbow(message).black.bg(:green)
      end

      def fail(message)
        Rainbow(message).black.bg(:red)
      end

      def warn(message)
        Rainbow(message).red.bg(:white)
      end

      def error(message)
        Rainbow(message).red.bg(:black)
      end

      def fatal(message)
        Rainbow(message).white.bg(:black)
      end
    end
  end
end

module Telemetry
  module Logger
    module Levels
      def self.levels
        [:obsolete, :data, :trace, :debug, :info, :pass, :fail, :focus, :warn, :error, :fatal]
      end

      def levels
        Levels.levels
      end

      def obsolete(message)
        write_level(__method__, message)
      end

      def write_level(level, message)
        level_ordinal = levels.index(level)
        write_message(level, message) if write?(level_ordinal)
      end

      def data(message)
        write_level(__method__, message)
      end

      def trace(message)
        level = __method__
        write_message('trace', message) if write?(2)
      end

      def debug(message)
        level = __method__
        write_message('debug', message) if write?(3)
      end

      def info(message)
        level = __method__
        write_message('info', message) if write?(4)
      end

      def pass(message)
        level = __method__
        write_message('pass', message) if write?(5)
      end

      def fail(message)
        level = __method__
        write_message('fail', message) if write?(6)
      end

      def focus(message)
        level = __method__
        write_message(level, message) if write?(7)
      end

      def warn(message)
        level = __method__
        write_message('warn', message) if write?(8)
      end

      def error(message)
        level = __method__
        write_message('error', message) if write?(9)
      end

      def fatal(message)
        level = __method__
        write_message('fatal', message) if write?(10)
      end

      def write_message(level, message)
        message = message.to_s

        message.each_line do |line|
          line = line.chomp("\n") unless line.end_with?("\r\n") || line == "\n"
          line = line.gsub("\r", "\\r")
          line = line.gsub("\n", "\\n")

          message = implementer.format(line, level)
          metadata = metadata(level)
          header = implementer.format_metadata(metadata)

          implementer.write "#{header}#{message}"
        end
      end

      def metadata(level)
        level = String(level)
        if Defaults.metadata == 'off'
          return nil
        elsif Defaults.metadata == 'minimal'
          return "#{name.split('::').last}: "
        else
         return "[#{implementer.clock.iso8601}] #{name} #{level.upcase}: "
        end
      end

      def write?(level_ordinal)
        level_ordinal >= level_number
      end

      def implementer
        self
      end

      module Defaults
        def self.metadata
          metadata = ENV['LOG_METADATA']
          return metadata if metadata

          'on'
        end
      end
    end
  end
end

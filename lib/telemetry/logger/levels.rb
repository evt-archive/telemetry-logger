module Telemetry
  module Logger
    module Levels
      def levels
        [:obsolete, :data, :trace, :debug, :info, :pass, :fail, :warn, :error, :fatal]
      end

      def obsolete(message)
        write_message('obsolete', message) if write?(0)
      end

      def data(message)
        message.each_line do |line|
          line = line.chomp("\n") unless line.end_with?("\r\n") || line == "\n"
          line = line.gsub("\r", "\\r")
          line = line.gsub("\n", "\\n")
          write_message('data', line) if write?(1)
        end
      end

      def trace(message)
        write_message('trace', message) if write?(2)
      end

      def debug(message)
        write_message('debug', message) if write?(3)
      end

      def info(message)
        write_message('info', message) if write?(4)
      end

      def pass(message)
        write_message('pass', message) if write?(5)
      end

      def fail(message)
        write_message('fail', message) if write?(6)
      end

      def warn(message)
        write_message('warn', message) if write?(7)
      end

      def error(message)
        write_message('error', message) if write?(8)
      end

      def fatal(message)
        write_message('fatal', message) if write?(9)
      end

      def write_message(level, message)
        message = implementer.format(message, level)

        metadata = metadata(level)

        header = implementer.format_metadata(metadata)

        implementer.write "#{header}#{message}"
      end

      def metadata(level)
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

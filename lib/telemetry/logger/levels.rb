module Telemetry
  module Logger
    module Levels
      def self.levels
        [
          :obsolete,
          :data,
          :trace,
          :debug,
          :info,
          :pass,
          :fail,
          :focus,
          :warn,
          :error,
          :fatal
        ]
      end

      def levels
        Levels.levels
      end

      def self.included(cls)
        levels.each do |level|
          define_level level, cls
        end
      end

      def self.define_level(level, cls)
        cls.send :define_method, level do |message|
          write_level(__method__, message)
        end
      end

      def write_level(level, message)
        level_ordinal = levels.index(level)
        write_message(message, level) if write?(level_ordinal)
      end

      def write_message(message, level)
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

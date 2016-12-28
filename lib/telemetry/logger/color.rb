class Telemetry
  module Logger
    module Color
      extend self

      def apply(level, message)
        if respond_to? level
          send level, message
        else
          message
        end
      end

      def metadata(text)
        TerminalColors::Apply.(text, fg: 'yellow')
      end

      def todo(message)
        TerminalColors::Apply.(message, fg: 'white', bg: 'white', bold: true)
      end

      def fubar(message)
        TerminalColors::Apply.(message, fg: 'red', bg: 'yellow')
      end

      def obsolete(message)
        TerminalColors::Apply.(message, fg: 'white', bold: true)
      end

      def opt_data(message)
        data(message)
      end

      def data(message)
        TerminalColors::Apply.(message, fg: 'cyan')
      end

      def opt_trace(message)
        trace(message)
      end

      def trace(message)
        TerminalColors::Apply.(message, fg: 'white')
      end

      def info(message)
        TerminalColors::Apply.(message, fg: 'green')
      end

      def pass(message)
        TerminalColors::Apply.(message, fg: 'black', bg: 'green')
      end

      def fail(message)
        TerminalColors::Apply.(message, fg: 'black', bg: 'red')
      end

      def focus(message)
        TerminalColors::Apply.(message, fg: 'white', bg: 'blue', bold: true)
      end

      def warn(message)
        TerminalColors::Apply.(message, fg: 'yellow', bg: 'black')
      end

      def error(message)
        TerminalColors::Apply.(message, fg: 'red', bg: 'black')
      end

      def fatal(message)
        TerminalColors::Apply.(message, fg: 'white', bg: 'black')
      end
    end
  end
end

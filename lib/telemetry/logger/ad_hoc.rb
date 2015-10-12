module Telemetry
  module Logger
    module AdHoc
      def self.activate(target_class=nil)
        target_class ||= Object

        return if target_class.is_a? self

        target_class.send :include, self
      end

      def __logger(subject=nil)
        subject ||= caller[0].split('/').last
        Telemetry::Logger.build "*** #{subject}"
      end
    end
  end
end

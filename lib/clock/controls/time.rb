module Clock
  module Controls
    module Time
      def self.example(time=nil)
        time ||= Raw.example
        ISO8601.example(time)
      end

      module Raw
        def self.example
          time = ::Time.parse("Jan 1 00:00:00 UTC 2000")
          Clock::UTC.now(time)
        end
      end

      module ISO8601
        def self.example(time=nil, precision: nil)
          time ||= Raw.example
          UTC.iso8601(time, precision)
        end
      end
    end
  end
end

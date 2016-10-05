module Clock
  module Controls
    module Time
      def self.example(time=nil, precision: nil)
        time ||= Raw.example

        ISO8601.example(time, precision: precision)
      end

      def self.reference
        ::Time.utc 2000
      end

      module Raw
        def self.example
          Time.reference
        end
      end

      module ISO8601
        def self.example(time=nil, precision: nil)
          time ||= Raw.example
          UTC.iso8601(time, precision: precision)
        end
      end
    end
  end
end

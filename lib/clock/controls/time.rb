module Clock
  module Controls
    module Time
      def self.example(time=nil, precision: nil)
        time ||= Raw.example

        ISO8601.example(time, precision: precision)
      end

      module Raw
        def self.example
          Reference.get
        end
      end

      module Reference
        def self.get
          ::Time.utc 2000
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

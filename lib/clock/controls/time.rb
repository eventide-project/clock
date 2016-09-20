module Clock
  module Controls
    module Time
      def self.example
        ISO8601.example
      end
      def self.reference; example; end

      module ISO8601
        def self.example(time=nil)
          time ||= Raw.example

          UTC.iso8601 time
        end
      end

      module Raw
        def self.example
          ::Time.utc(2000)
        end
      end
    end
  end
end

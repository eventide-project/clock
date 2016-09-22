module Clock
  module Controls
    module Time
      module Elapsed
        def self.example(units=nil, precision: nil)
          time = Raw.example units, precision: precision

          ISO8601.example time, precision: precision
        end

        module Raw
          def self.example(units=nil, precision: nil)
            units ||= 1

            reference = Time::Raw.example

            unit_duration = Unit::Duration::Seconds.example precision: precision

            elapsed_seconds = units * unit_duration

            reference + elapsed_seconds
          end
        end
      end
    end
  end
end

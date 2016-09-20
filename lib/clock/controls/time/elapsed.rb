module Clock
  module Controls
    module Time
      module Elapsed
        def self.example(units, reference: nil, precision: nil)
          reference ||= Time.example
          reference = Clock.parse reference if reference.is_a? String

          units_per_second = self.units_per_second(precision: precision)
          elapsed_seconds = Rational(units, units_per_second)

          elapsed_time = reference + elapsed_seconds

          ISO8601.example elapsed_time
        end

        def self.reference(precision: nil)
          example 0, precision: precision
        end

        def self.units_per_second(precision: nil)
          precision ||= Clock::ISO8601::Defaults.precision

          10 ** precision
        end
      end
    end
  end
end

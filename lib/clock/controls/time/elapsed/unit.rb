module Clock
  module Controls
    module Time
      module Elapsed
        module Unit
          module Frequency
            def self.example(precision: nil)
              precision ||= Clock::ISO8601::Defaults.precision

              10 ** precision
            end
          end

          module Duration
            module Seconds
              def self.example(precision: nil)
                frequency = Frequency.example precision: precision

                Rational(1, frequency)
              end
            end
          end
        end
      end
    end
  end
end

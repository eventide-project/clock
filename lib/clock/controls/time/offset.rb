module Clock
  module Controls
    module Time
      module Offset
        def self.example(amount=nil, precision: nil, time: nil)
          offset_time = Raw.example(amount, precision: precision, time: time)

          ISO8601.example(offset_time, precision: precision)
        end

        module Raw
          def self.example(amount=nil, precision: nil, time: nil)
            amount ||= 1
            time ||= Time::Raw.example

            scale = scale(precision: precision)

            offset = amount * scale

            if RUBY_ENGINE == 'mruby'
              time + offset.to_f
            else
              time + offset
            end
          end

          def self.scale(precision: nil)
            precision ||= Clock::ISO8601::Defaults.precision

            scale = 10 ** precision

            Rational(1, scale)
          end
        end
      end
    end
  end
end

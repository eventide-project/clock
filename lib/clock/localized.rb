module Clock
  class Localized
    attr_reader :timezone

    def initialize(timezone)
      @timezone = timezone
    end

    def self.build(identifier=nil)
      identifier = Defaults.identifier(identifier)
      timezone = TZInfo::Timezone.get(identifier)
      new(timezone)
    end

    def self.configure(receiver, identifier=nil)
      instance = build(identifier)
      receiver.clock = instance
      instance
    end

    def system_time
      timezone
    end

    def now(time=nil)
      time ||= system_time.now
      canonize(time)
    end

    def iso8601(time=nil, precision=nil)
      precision ||= Clock::ISO8601.precision
      time = time.nil? ? now : canonize(time)
      time.iso8601(precision)
    end

    def parse(str)
      time = Clock.system_time.parse str
      canonize(time)
    end

    def canonize(time)
      total_offset = timezone.current_period.offset.utc_total_offset
      offset_hours, offset_seconds = total_offset.abs.divmod(3600)
      offset_minutes = offset_seconds / 60

      sign = total_offset > 0 ? '+' : '-'
      offset = "#{sign}#{offset_hours.to_s.rjust(2, '0')}:#{offset_minutes.to_s.rjust(2, '0')}"

      Time.new(time.year, time.month, time.day, time.hour, time.min, time.sec, offset)
    end

    module Defaults
      def self.identifier(identifier)
        env_identifier = ENV['TIMEZONE']

        if env_identifier
          identifier = env_identifier
        end

        unless identifier
          identifier = 'America/Mexico_City'
        end

        identifier
      end
    end
  end
end

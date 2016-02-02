module Clock
  class Localized
    class Timezone
      attr_reader :tzinfo_timezone
      attr_writer :now

      def initialize(tzinfo_timezone)
        @tzinfo_timezone = tzinfo_timezone
      end

      def self.build(timezone_identifier=nil)
        timezone_identifier = Defaults.timezone_identifier(timezone_identifier)
        tzinfo_timezone = TZInfo::Timezone.get(timezone_identifier)
        new tzinfo_timezone
      end

      def current_period
        tzinfo_timezone.current_period
      end

      def now(tzinfo_time=nil)
        tzinfo_time ||= tzinfo_timezone.now
        convert tzinfo_time
      end

      def utc_to_local(utc_time)
        tzinfo_time = tzinfo_timezone.utc_to_local utc_time
        convert tzinfo_time
      end

      def convert(tzinfo_time)
        Time.new(
          tzinfo_time.year,
          tzinfo_time.month,
          tzinfo_time.day,
          tzinfo_time.hour,
          tzinfo_time.min,
          tzinfo_time.sec,
          offset
        )
      end

      def offset
        total_offset = tzinfo_timezone.current_period.offset.utc_total_offset

        hours, seconds = total_offset.abs.divmod 3600
        minutes = seconds / 60

        sign = total_offset > 0 ? '+' : '-'
        offset = "#{sign}#{hours.to_s.rjust(2, '0')}:#{minutes.to_s.rjust(2, '0')}"
      end
    end
  end
end

module Clock
  class Localized
    class Timezone
      attr_reader :tzinfo_timezone
      attr_reader :utc_reference

      def initialize(tzinfo_timezone, utc_reference)
        @tzinfo_timezone = tzinfo_timezone
        @utc_reference = utc_reference
      end

      def self.build(timezone_identifier=nil, utc_reference: nil)
        utc_reference ||= Time.now.utc

        timezone_identifier = Defaults.timezone_identifier(timezone_identifier)
        tzinfo_timezone = TZInfo::Timezone.get(timezone_identifier)

        new tzinfo_timezone, utc_reference
      end

      def period
        tzinfo_timezone.period_for_utc utc_reference
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
        seconds = tzinfo_time.sec + tzinfo_time.subsec

        Time.new(
          tzinfo_time.year,
          tzinfo_time.month,
          tzinfo_time.day,
          tzinfo_time.hour,
          tzinfo_time.min,
          seconds,
          offset
        )
      end

      def offset
        total_offset = period.offset.utc_total_offset

        hours, seconds = total_offset.abs.divmod 3600
        minutes = seconds / 60

        sign = total_offset > 0 ? '+' : '-'
        offset = "#{sign}#{hours.to_s.rjust(2, '0')}:#{minutes.to_s.rjust(2, '0')}"
      end
    end
  end
end

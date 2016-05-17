module Clock
  class UTC
    include Clock

    def self.canonize(time, *)
      Clock.utc(time)
    end

    def coerce(time)
      self.class.shift(time)
    end

    def self.coerce(time)
      if time.is_a? String
        time = Time.parse(time)
      end

      offset = time.gmt_offset

      utc_time = time.getutc

      utc_time = utc_time + offset

      now(utc_time)
    end

    module Substitute
      def self.build
        Clock::Substitute.new
      end
    end
  end
end

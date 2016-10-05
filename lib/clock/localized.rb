module Clock
  class Localized
    include Clock

    attr_reader :timezone

    def initialize(timezone)
      @timezone = timezone
    end

    def self.build(timezone_identifier=nil, utc_reference: nil)
      timezone = Timezone.build timezone_identifier, utc_reference: utc_reference
      new(timezone)
    end

    def self.configure(receiver, timezone_identifier=nil)
      instance = build(timezone_identifier)
      receiver.clock = instance
      instance
    end

    def system_time
      timezone
    end

    def self.canonize(time, system_time)
      time = time.utc
      system_time.utc_to_local time
    end

    def self.iso8601(time, precision: nil, system_time: nil)
      time ||= now time, system_time: system_time
      utc_time = time.utc
      local_time = system_time.utc_to_local utc_time
      local_time.iso8601 precision
    end

    module Defaults
      def self.timezone_identifier(timezone_identifier)
        env_identifier = ENV['TIMEZONE']

        if env_identifier
          timezone_identifier = env_identifier
        end

        unless timezone_identifier
          timezone_identifier = 'America/Mexico_City'
        end

        timezone_identifier
      end
    end

    module Substitute
      def self.build
        Clock::Substitute.new
      end
    end
  end
end

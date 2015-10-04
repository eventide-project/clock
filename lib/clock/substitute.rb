module Clock
  class Substitute
    include Clock

    attr_writer :system_time

    def system_time
      @system_time ||= NullTime.build
    end

    def now=(val)
      system_time = OpenStruct.new
      system_time.now = val
      self.system_time = system_time
      system_time
    end

    def iso8601(*args)
      if system_time.is_a? OpenStruct
        return super(*args)
      end
      nil
    end

    class NullTime < Naught.build
      def self.build
        new
      end
    end
  end
end

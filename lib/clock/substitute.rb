module Clock
  class Substitute
    include Clock

    attr_writer :system_time

    def system_time
      @system_time ||= Clock.system_time
    end

    def now=(val)
      self.system_time = SubstituteSystemTime.new
      system_time.now = val
      system_time
    end

    class SubstituteSystemTime
      attr_accessor :now
    end
  end
end

class Clock
  class Local < Clock
    def self.configure(receiver)
      instance = new
      instance.configure receiver
    end

    def now(time=nil)
      time ||= Clock.now
      time
    end

    def to_s(time=nil)
      time ||= now
      Clock.iso8601(time)
    end

    def timestamp(time=nil)
      time ||= now
      Clock.timestamp(time)
    end
  end
end

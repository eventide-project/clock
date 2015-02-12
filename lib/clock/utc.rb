class Clock
  class UTC
    def self.configure(receiver)
      instance = new
      receiver.clock = instance
      instance
    end

    def now(time=nil)
      time ||= Time.now
      Clock.utc(time)
    end

    def to_s(time=nil)
      time ||= Time.now
      time = Clock.utc(time)
      Clock.iso8601(time)
    end
  end
end

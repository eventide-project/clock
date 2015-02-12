class Clock
  class Local < Clock
    def self.configure(receiver)
      instance = new
      instance.configure receiver
    end

    def now(time=nil)
      time ||= Time.now
      time
    end

    def to_s(time=nil)
      time ||= Time.now
      Clock.iso8601(time)
    end
  end
end

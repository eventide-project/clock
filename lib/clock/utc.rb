class Clock
  class UTC < Clock
    def self.configure(receiver)
      instance = new
      instance.configure receiver
    end

    def now(time=nil)
      time ||= Clock.now
      Clock.utc(time)
    end
  end
end

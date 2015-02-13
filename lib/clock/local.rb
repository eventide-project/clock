class Clock
  class Local < Clock
    def self.configure(receiver)
      instance = new
      instance.configure receiver
      receiver
    end

    def now(time=nil)
      time ||= Clock.now
      time
    end
  end
end

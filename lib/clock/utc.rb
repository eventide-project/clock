class Clock
  class UTC
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

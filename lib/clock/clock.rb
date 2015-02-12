class Clock
  def self.utc(time)
    time.utc
  end

  def self.iso8601(time)
    time.iso8601(3)
  end

  def self.parse(str)
    Time.parse str
  end

  def elapsed_milliseconds(starting, ending)
    ((ending - starting) * 1000).round
  end

  def elapsed_milliseconds(starting, ending)
    starting = Time.parse(starting) if starting.is_a? String
    ending = Time.parse(ending) if ending.is_a? String

    ((ending - starting) * 1000).round
  end

  def configure(receiver)
    receiver.clock = self
    self
  end
end

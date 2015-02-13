class Clock
  def self.now
    Time.now
  end

  def self.utc(time)
    time.utc
  end

  def self.iso8601(time)
    time.iso8601(3)
  end

  def self.timestamp(time)
    time.to_f
  end

  def self.parse(str)
    Time.parse str
  end

  def parse(str)
    Clock.parse str
  end

  def iso8601(time=nil)
    time ||= now
    Clock.iso8601(time)
  end
  alias :to_s :iso8601

  def timestamp(time=nil)
    time ||= now
    Clock.timestamp(time)
  end

  def elapsed_milliseconds(start_time, end_time)
    start_time = Clock.parse(start_time) if start_time.is_a? String
    end_time = Clock.parse(end_time) if end_time.is_a? String

    ((end_time - start_time) * 1000).round
  end

  def configure(receiver)
    receiver.clock = self
    receiver
  end
end

module Clock
  def self.included(cls)
    cls.extend Now
    cls.extend SystemTime
    cls.extend ISO8601
    cls.extend Configure
  end

  def now(time=nil)
    time || self.class.now
  end

  def self.utc(time)
    time.utc
  end

  def self.timestamp(time)
    time.to_f
  end

  def iso8601(time=nil)
    time ||= now
    ISO8601.iso8601 time
  end

  def self.parse(str)
    SystemTime.system_time.parse str
  end

  def self.elapsed_milliseconds(start_time, end_time)
    start_time = parse(start_time) if start_time.is_a? String
    end_time = parse(end_time) if end_time.is_a? String

    ((end_time - start_time) * 1000).round
  end

  module Now
    def now
      system_time.instance_exec &mode
    end
  end

  module ISO8601
    extend self
    def iso8601(time=nil, precision=3)
      time ||= now
      time.iso8601(precision)
    end
  end

  module SystemTime
    extend self
    def system_time
      Time
    end
  end

  module Configure
    def configure(receiver)
      instance = new
      receiver.clock = instance
      receiver
    end
  end
end

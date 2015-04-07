module Clock
  def self.included(cls)
    cls.extend Now
    cls.extend Canonize
    cls.extend SystemTime
    cls.extend ISO8601
    cls.extend Parse
    cls.extend ElapsedMilliseconds
    cls.extend Timestamp
    cls.extend Configure
  end

  def now(time=nil)
    time || self.class.now
  end

  def canonize(time)
    self.class.canonize time
  end

  def system_time
    self.class.system_time
  end

  def iso8601(time=nil)
    self.class.iso8601 time
  end

  def parse(str)
    self.class.parse str
  end

  def timestamp(time=nil)
    self.class.timestamp time
  end

  def self.local(time)
    time.getlocal
  end

  def self.utc(time)
    time.utc
  end

  def elapsed_milliseconds(start_time, end_time)
    self.class.elapsed_milliseconds(start_time, end_time)
  end

  module Now
    def now(time=nil)
      time ||= system_time.now
      canonize(time)
    end
  end

  module Canonize
    def canonize(time)
      time
    end
  end

  module SystemTime
    extend self
    def system_time
      Time
    end
  end

  module ISO8601
    extend self
    def iso8601(time=nil, precision=3)
      time ||= now
      time.iso8601(precision)
    end
  end

  module Parse
    extend self
    def parse(str, canonize=false)
      time = SystemTime.system_time.parse str
      time = canonize(time)
      time
    end
  end

  module ElapsedMilliseconds
    extend self
    def elapsed_milliseconds(start_time, end_time)
      start_time = parse(start_time) if start_time.is_a? String
      end_time = parse(end_time) if end_time.is_a? String

      ((end_time - start_time) * 1000).round
    end
  end

  module Timestamp
    extend self
    def timestamp(time=nil)
      time ||= now
      time.to_f
    end
  end

  module Configure
    def configure(receiver)
      instance = new
      receiver.clock = instance
      receiver
    end
  end

  extend Now
  extend Canonize
  extend SystemTime
  extend ISO8601
  extend Parse
  extend ElapsedMilliseconds
  extend Timestamp
end

module Clock
  class Error < RuntimeError; end

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
    time || self.class.now(system_time: system_time)
  end

  def canonize(time)
    self.class.canonize(time, system_time)
  end

  def system_time
    self.class.system_time
  end

  def iso8601(time=nil, precision: nil)
    time ||= now
    self.class.iso8601 time, precision: precision, system_time: system_time
  end

  def parse(str)
    time = self.class.parse(str, system_time: system_time)
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
    def now(time=nil, system_time: nil)
      system_time ||= self.system_time
      time ||= system_time.now
      canonize(time, system_time)
    end
  end

  module Canonize
    def canonize(time, system_time)
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
    def iso8601(time=nil, precision: nil, system_time: nil)
      precision ||= self.precision
      time ||= now(system_time: system_time)
      time.iso8601(precision)
    end

    def precision
      Defaults.precision
    end

    module Defaults
      def self.precision
        3
      end
    end
  end

  module Parse
    extend self
    def parse(str, system_time: nil)
      system_time ||= self.system_time
      time = Time.parse str
      canonize(time, system_time)
    end
  end

  module ElapsedMilliseconds
    extend self
    def elapsed_milliseconds(start_time, end_time=nil, system_time: nil)
      end_time ||= now(system_time: system_time)

      start_time = parse(start_time) if start_time.is_a? String
      end_time = parse(end_time) if end_time.is_a? String

      ((end_time - start_time) * 1000).round
    end
  end

  module Timestamp
    extend self
    def timestamp(time=nil, system_time: nil)
      time ||= now(system_time: system_time)
      time.to_f
    end
  end

  module Configure
    def configure(receiver, attr_name: nil)
      attr_name ||= :clock
      instance = new
      receiver.public_send("#{attr_name}=", instance)
      instance
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

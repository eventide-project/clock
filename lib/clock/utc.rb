module Clock
  class UTC
    include Clock

    # def self.mode
    #   -> { Clock.utc(now) }
    # end

    def self.now
      Clock.utc system_time.now
    end

    def self.parse(str)
      time = Parse.parse str
      Clock.utc(time)
    end

    def parse(str)
      self.class.parse str
    end
  end
end

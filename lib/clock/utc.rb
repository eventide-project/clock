module Clock
  class UTC
    include Clock

    def self.now
      Clock.utc system_time.now
    end

    def self.parse(str)
      time = Parse.parse str
      Clock.utc(time)
    end
  end
end

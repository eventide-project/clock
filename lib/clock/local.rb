module Clock
  class Local
    include Clock

    def self.now
      system_time.now
    end

    def self.parse(str)
      time = Parse.parse str
      Clock.local(time)
    end
  end
end

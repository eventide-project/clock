module Clock
  class UTC
    include Clock

    def self.canonize(time)
      Clock.utc(time)
    end
  end
end

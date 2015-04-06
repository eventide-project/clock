module Clock
  class UTC
    include Clock

    def self.mode
      -> { Clock.utc(now) }
    end
  end
end

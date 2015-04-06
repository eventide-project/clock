module Clock
  class Local
    include Clock

    def self.mode
      -> { now }
    end
  end
end

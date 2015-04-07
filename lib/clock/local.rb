module Clock
  class Local
    include Clock

    def self.canonize(time)
      Clock.local(time)
    end
  end
end

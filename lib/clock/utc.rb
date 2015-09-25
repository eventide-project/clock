module Clock
  class UTC
    include Clock

    def self.canonize(time, *)
      Clock.utc(time)
    end

    module Substitute
      def self.build
        Clock::Substitute.new
      end
    end
  end
end

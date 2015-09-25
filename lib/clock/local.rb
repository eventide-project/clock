module Clock
  class Local
    include Clock

    def self.canonize(time, *)
      Clock.local(time)
    end

    module Substitute
      def self.build
        Clock::Substitute.new
      end
    end
  end
end

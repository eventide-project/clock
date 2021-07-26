module Clock
  class Substitute
    include Clock

    attr_writer :system_time

    def system_time
      @system_time ||= self.class.null_time
    end

    def now=(val)
      system_time = OpenStruct.new
      system_time.now = val
      self.system_time = system_time
      system_time
    end

    def iso8601(time=nil, precision: nil)
      if system_time.is_a? OpenStruct
        return super(time, precision: precision)
      end
      nil
    end

    def self.null_time
      Mimic.(Object) do
        def method_missing(*)
        end
      end
    end
  end
end

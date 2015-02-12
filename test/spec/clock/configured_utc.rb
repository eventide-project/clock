module ConfiguredUTC
  class Example
    attr_accessor :clock
  end
end

describe ConfiguredUTC::Example do
  context "Configured" do
    let(:clock) { subject.clock }

    before do
      Clock::UTC.configure subject
    end

    specify "Receiver has a UTC clock" do
      expect(clock).to be_instance_of(Clock::UTC)
    end
  end
end

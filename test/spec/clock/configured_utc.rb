module Configurable
  class Example
    attr_accessor :clock
  end
end

describe Configurable::Example do
  context "Configured" do
    let(:clock) { subject.clock }

    before do
      Clock::UTC.configure subject
    end

    specify "Receiver has a clock" do
      expect(clock).to be_instance_of(Clock::UTC)
    end
  end
end

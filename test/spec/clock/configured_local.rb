module ConfiguredLocal
  class Example
    attr_accessor :clock
  end
end

describe ConfiguredLocal::Example do
  context "Configured" do
    let(:clock) { subject.clock }

    before do
      Clock::Local.configure subject
    end

    specify "Receiver has a local clock" do
      expect(clock).to be_instance_of(Clock::Local)
    end
  end
end

describe Clock::Substitute do
  let(:now) { Time.parse("Jan 1 11:11:11 EDT 2000") }

  let(:clock) do
    clock = Clock::Substitute.new
    clock.now = now
    clock
  end

  context "Current Time" do
    specify "Assigned time" do
      expect(clock.now).to be now
    end
  end

  context "ISO 8601" do
    let(:iso8601_now) { now.iso8601(3) }

    specify "Time represented as a string" do
      expect(clock.iso8601).to eq(iso8601_now)
    end
  end
end

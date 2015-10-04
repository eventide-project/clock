describe Clock::Substitute do
  let(:now) { Time.parse("Jan 1 11:11:11 EDT 2000") }
  let(:clock_class) { Clock::Substitute }

  context "No assigned time" do
    let(:clock) do
      clock_class.new
    end

    context "Current Time" do
      specify "Is nil" do
        expect(clock.now).to be nil
      end
    end

    context "ISO 8601" do
      specify "Time represented as a string" do
        expect(clock.iso8601).to be nil
      end
    end
  end

  context "Assigned Time" do
    let(:clock) do
      clock = clock_class.new
      clock.now = now
      clock
    end

    context "Current Time" do
      specify "Is the assigned time" do
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
end

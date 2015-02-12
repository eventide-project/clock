describe Clock::UTC do
  let(:now) { Time.now.utc }

  context "UTC" do
    specify "Current time" do
      expect(subject.now).to be_utc
    end
  end

  context "Timestamp" do
    let(:timestamp) { subject.timestamp(now) }
    let(:float_now) { now.to_f }

    specify "Timestamp for local current time" do
      expect(timestamp).to eq float_now
    end
  end

  context "ISO 8601" do
    let(:iso8601_now) { now.utc.iso8601(3) }

    specify "Time represented as a sting" do
      expect(subject.iso8601(now)).to eq(iso8601_now)
    end

    context "String representation converted to time" do
      let(:converted_now) { Clock.parse(iso8601_now) }

      specify "Remains UTC" do
        expect(converted_now).to be_utc
      end
    end
  end
end

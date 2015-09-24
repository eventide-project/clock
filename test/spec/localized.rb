describe Clock::Localized do
  let(:now) { Time.parse("Jan 1 11:11:11 EDT 2000") }
  let(:clock) { Clock::Localized.build 'America/New_York' }

  context "Current Time" do
    specify "Localized" do
      expect(clock.now).to_not be_utc
    end
  end

  context "ISO 8601" do
    let(:iso8601_now) { now.iso8601(3) }

    specify "Time represented as a sting" do
      expect(clock.iso8601(now)).to eq(iso8601_now)
    end

    context "String representation converted to time" do
      let(:converted_now) { Clock.parse(iso8601_now) }

      specify "Remains localized" do
        expect(converted_now).to_not be_utc
      end
    end
  end

  context "Converting from a string representation" do
    let(:now_text) { "Jan 1 11:11:11 CDT 2000" }

    specify "Is localized" do
      time = clock.parse now_text
      expect(time.to_s).to eq '2000-01-01 11:11:11 -0400'
    end
  end
end

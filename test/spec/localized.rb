require_relative 'spec_init'

describe Clock::Localized do
  now = Time.parse("Jan 1 11:11:11 EDT 2000")
  clock = Clock::Localized.build 'America/New_York'

  context "Current Time" do
    specify "Localized" do
      refute(clock.now.utc?)
    end
  end

  context "ISO 8601" do
    iso8601_now = now.iso8601(3)

    specify "Time represented as a string" do
      assert(clock.iso8601(now) == iso8601_now)
    end

    context "String representation converted to time" do
      converted_now = Clock.parse(iso8601_now)

      specify "Remains localized" do
        refute(converted_now.utc?)
      end
    end
  end

  context "Converting from a string representation" do
    now_text = "Jan 1 11:11:11 CDT 2000"

    specify "Is localized" do
      time = clock.parse now_text
      assert(time.to_s == '2000-01-01 11:11:11 -0500')
    end
  end
end

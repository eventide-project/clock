require_relative 'spec_init'

describe Clock::UTC do
  now = Time.now.utc
  clock = Clock::UTC

  context "UTC" do
    specify "Current time" do
      assert(clock.now.utc?)
    end
  end

  context "ISO 8601" do
    iso8601_now = now.iso8601(3)

    specify "Time represented as a sting" do
      assert(clock.iso8601(now) == iso8601_now)
    end

    context "String representation converted to time" do
      converted_now = Clock.parse(iso8601_now)

      specify "Remains UTC" do
        assert(converted_now.utc?)
      end
    end
  end
end

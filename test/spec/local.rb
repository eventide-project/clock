require_relative 'spec_init'

describe Clock::Local do
  now = Time.now
  clock = Clock::Local.new

  context "Local" do
    specify "Current time" do
      refute(clock.now(now).utc?)
    end
  end

  context "ISO 8601" do
    iso8601_now = now.iso8601(3)

    specify "Time represented as a sting" do
      assert(clock.iso8601(now) == iso8601_now)
    end

    context "String representation converted to time" do
      converted_now = Clock.parse(iso8601_now)

      specify "Remains local" do
        refute(converted_now.utc?)
      end
    end
  end
end

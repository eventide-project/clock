require_relative 'automated_init'

context "Local clock" do
  now = Time.now
  clock = Clock::Local.new

  context "Local" do
    test "Current time" do
      assert(!clock.now(now).utc?)
    end
  end

  context "ISO 8601" do
    iso8601_now = now.iso8601(3)

    test "Time represented as a sting" do
      assert(clock.iso8601(now) == iso8601_now)
    end

    context "String representation converted to time" do
      converted_now = Clock.parse(iso8601_now)

      test "Remains local" do
        assert(!converted_now.utc?)
      end
    end
  end
end

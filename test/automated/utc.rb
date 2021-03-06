require_relative 'automated_init'

context "UTC clock" do
  now = Time.now.utc
  clock = Clock::UTC

  context "UTC" do
    test "Current time" do
      assert(clock.now.utc?)
    end
  end

  context "ISO 8601" do
    iso8601_now = now.iso8601(3)

    test "Time represented as a sting" do
      assert(clock.iso8601(now) == iso8601_now)
    end

    context "String representation converted to time" do
      converted_now = Clock.parse(iso8601_now)

      test "Remains UTC" do
        assert(converted_now.utc?)
      end
    end
  end

  context "Shift timezone to UTC" do
    local = Time.local(2000, 1, 1, 11, 11, 11, 111)
    coerced_control = Time.utc(2000, 1, 1, 11, 11, 11, 111)

    coerced = clock.coerce(local)

    test "UTC time is same time as original time, except in the UTC zone" do
      assert(coerced == coerced_control)
    end
  end
end

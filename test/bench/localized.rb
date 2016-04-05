require_relative 'bench_init'

context "Localized clock" do
  now = Time.parse("Jan 1 11:11:11 PST 2000")
  clock = Clock::Localized.build 'America/Los_Angeles'

  context "Current Time" do
    test "Localized" do
      assert(!clock.now.utc?)
    end
  end

  context "ISO 8601" do
    iso8601_now = now.iso8601(3)

    test "Time represented as a string" do
      assert(clock.iso8601(now, precision: 3) == iso8601_now)
    end

    context "String representation converted to time" do
      converted_now = Clock.parse(iso8601_now)

      test "Remains localized" do
        assert(!converted_now.utc?)
      end
    end

    test "Localization" do
      cst_now = Time.parse("Jan 1 13:11:11 CST 2000")

      iso8601 = clock.iso8601 cst_now

      assert iso8601 == "2000-01-01T11:11:11-08:00"
    end
  end

  context "Converting from a string representation" do
    test "Is localized" do
      now_text = "Jan 1 13:11:11 CST 2000"

      time = clock.parse now_text

      assert time == now
    end
  end
end

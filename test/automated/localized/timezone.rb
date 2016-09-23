require_relative '../automated_init'

context "TZInfo Timezone Wrapper" do
  # If the current time in America/New_York is 11:11:11 on Jan 1 2000, the
  # tzinfo library will correctly report the time for the time zone as 11:11:11.
  # However, it will set the actual timezone in the Time object to UTC.
  timezone_identifier = 'America/Los_Angeles'
  seconds_per_hour = 60 * 60
  utc_offset = -5 * seconds_per_hour

  context do
    tzinfo_time = Time.parse("Jan 1 11:11:11.111 UTC 2000")
    correct_time = Time.parse("Jan 1 11:11:11.111 PST 2000")
    utc_reference = tzinfo_time

    test "Current time has its offset adjusted to the timezone" do
      timezone = Clock::Localized::Timezone.build timezone_identifier, :utc_reference => utc_reference

      now = timezone.now tzinfo_time

      assert now == correct_time
    end

    test "Converting UTC time to the local time of the timezone" do
      cst_time = Time.parse("Jan 1 13:11:11.111 CST 2000")
      timezone = Clock::Localized::Timezone.build timezone_identifier, :utc_reference => utc_reference

      localized_time = timezone.utc_to_local cst_time.utc

      assert localized_time == correct_time
    end

    test "TZInfo incorrectly reports local time with a UTC offset" do
      timezone = Clock::Localized::Timezone.build timezone_identifier, :utc_reference => utc_reference

      assert timezone.tzinfo_timezone.now.utc?
    end
  end

  context "During daylight savings" do
    tzinfo_time = Time.parse("Jul 1 11:11:11.111 UTC 2000")
    correct_time = Time.parse("Jul 1 11:11:11.111 PDT 2000")
    utc_reference = tzinfo_time

    test "Current time has its offset adjusted to the timezone with daylight savings" do
      timezone = Clock::Localized::Timezone.build timezone_identifier, :utc_reference => utc_reference

      now = timezone.now tzinfo_time

      assert now == correct_time
    end
  end
end

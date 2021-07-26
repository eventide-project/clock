require_relative '../automated_init'

context "Substitute clock" do
  context "ISO8601 Precision" do
    now = Clock::Controls::Time::Offset::Raw.example(123)

    clock_class = Clock::Substitute

    clock = clock_class.new
    clock.now = now

    precision = 2

    iso8601 = clock.iso8601(precision: precision)

    comment "Precision: #{precision}"
    comment "Original Millisecond Offset: #{now.usec / 1000}ms"

    offset_microseconds = Clock.parse(iso8601).usec
    offset_milliseconds = offset_microseconds / 1000
    comment "Millisecond Offset: #{offset_milliseconds}ms"

    control_offset_microseconds = Clock.parse(now.iso8601(precision)).usec
    control_offset_milliseconds = control_offset_microseconds / 1000
    detail "Control Millisecond Offset: #{control_offset_milliseconds}ms"

    correct_precision = offset_milliseconds == control_offset_milliseconds

    test do
      assert(correct_precision)
    end
  end
end

require_relative '../automated_init'

context "Substitute clock" do
  context "No assigned time" do
    clock = Clock::Substitute.new

    context "Current Time" do
      current_time = clock.now

      comment current_time.inspect

      test "Is a Time value" do
        assert(current_time.is_a?(Time))
      end
    end

    context "ISO 8601" do
      iso8601_now = clock.iso8601

      comment iso8601_now.inspect

      test "Is a String value" do
        assert(clock.iso8601.is_a?(String))
      end
    end
  end

  context "Assigned Time" do
    clock = Clock::Substitute.new

    control_time = Clock::Controls::Time::Raw.example

    comment "Control: #{control_time.inspect}"

    clock.now = control_time

    context "Current Time" do
      current_time = clock.now

      comment current_time.inspect

      test "Is the assigned time" do
        assert(clock.now == control_time)
      end
    end

    context "ISO 8601" do
      iso8601_now = control_time.iso8601(3)

      comment iso8601_now.inspect

      test "Time represented as a string" do
        assert(clock.iso8601 == iso8601_now)
      end
    end
  end
end

require_relative 'automated_init'

context "Substitute clock" do
  now = Time.parse("Jan 1 11:11:11 EDT 2000")
  clock_class = Clock::Substitute

  context "No assigned time" do
    clock = clock_class.new

    context "Current Time" do
      test "Is nil" do
        assert(clock.now.nil?)
      end
    end

    context "ISO 8601" do
      test "Time represented as a string" do
        assert(clock.iso8601.nil?)
      end
    end
  end

  context "Assigned Time" do
    clock = clock_class.new
    clock.now = now

    context "Current Time" do
      test "Is the assigned time" do
        assert(clock.now == now)
      end
    end

    context "ISO 8601" do
      iso8601_now = now.iso8601(3)

      test "Time represented as a string" do
        assert(clock.iso8601 == iso8601_now)
      end
    end
  end
end

require_relative 'bench_init'

context "Clock" do
  context "Elapsed milliseconds" do
    t1 = Time.at 0
    t2 = t1 + 1

    context "Two times" do
      start_time = t1
      end_time = t2
      elapsed_milliseconds = Clock.elapsed_milliseconds(start_time, end_time)
      difference = ((t2 - t1) * 1000).round

      test "The difference in milliseconds" do
        assert(elapsed_milliseconds == difference)
      end
    end

    context "Time strings" do
      t1_iso8601 = t1.iso8601(3)
      t2_iso8601 = t2.iso8601(3)
      difference = ((t2 - t1) * 1000).round

      context "Two time strings" do
        start_time = t1_iso8601
        end_time = t2_iso8601
        elapsed_milliseconds = Clock.elapsed_milliseconds(start_time, end_time)

        test "Convert the strings to time and find the difference" do
          assert(elapsed_milliseconds == difference)
        end
      end

      context "A starting time string and an ending time" do
        start_time = t1_iso8601
        end_time = t2
        elapsed_milliseconds = Clock.elapsed_milliseconds(start_time, end_time)
        difference = ((t2 - t1) * 1000).round

        test "Convert the strings to time and find the difference" do
          assert(elapsed_milliseconds == difference)
        end
      end

      context "A starting time and an ending time string" do
        start_time = t1
        end_time = t2_iso8601
        elapsed_milliseconds = Clock.elapsed_milliseconds(start_time, end_time)
        difference = ((t2 - t1) * 1000).round

        test "Convert the strings to time and find the difference" do
          assert(elapsed_milliseconds == difference)
        end
      end
    end
  end
end

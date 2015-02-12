describe Clock do
  context "Elapsed milliseconds" do
    let(:t1) { Time.now }
    let(:t2) { t1 + 1 }
    let(:difference) { ((t2 - t1) * 1000).round }
    let(:elapsed_milliseconds) { subject.elapsed_milliseconds(start_time, end_time) }

    context "Two times" do
      let(:start_time) { t1 }
      let(:end_time) { t2 }

      specify "The difference in milliseconds" do
        expect(elapsed_milliseconds).to eq(difference)
      end
    end

    context "Time strings" do
      let(:t1_iso8601) { t1.iso8601(3) }
      let(:t2_iso8601) { t2.iso8601(3) }

      context "Two time strings" do
        let(:start_time) { t1_iso8601 }
        let(:end_time) { t2_iso8601 }

        specify "Convert the strings to time and find the difference" do
          expect(elapsed_milliseconds).to eq(difference)
        end
      end

      context "A starting time string and an ending time" do
        let(:start_time) { t1_iso8601 }
        let(:end_time) { t2 }

        specify "Convert the strings to time and find the difference" do
          expect(elapsed_milliseconds).to eq(difference)
        end
      end

      context "A starting time and an ending time string" do
        let(:start_time) { t1 }
        let(:end_time) { t2_iso8601 }

        specify "Convert the strings to time and find the difference" do
          expect(elapsed_milliseconds).to eq(difference)
        end
      end
    end
  end
end

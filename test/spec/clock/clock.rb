describe Clock do
  let(:now) { Time.now }

  let(:timestamp) { Clock.timestamp(now) }
  let(:float_now) { now.to_f }

  specify "Timestamp for local current time" do
    expect(timestamp).to eq float_now
  end
end

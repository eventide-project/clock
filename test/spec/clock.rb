require_relative 'spec_init'

describe Clock do
  now = Time.now

  timestamp = Clock.timestamp(now)
  float_now = now.to_f

  specify "Timestamp for local current time" do
    assert(timestamp == float_now)
  end
end

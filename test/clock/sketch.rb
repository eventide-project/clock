require_relative 'clock_init'

class Example
  attr_accessor :clock

  def self.build
    instance = new
    Clock::UTC.configure instance
    instance
  end
end

e = Example.build


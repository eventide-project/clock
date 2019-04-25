# clock

Clock interface with support for UTC and local timezones, timezone coercion, and dependency substitution.

## Synopsis

```ruby
require 'clock'

# Get current time
utc_time = Clock::UTC.now # Current time in the UTC timezone
local_time = Clock::Local.now # Current time in the local timezone

# Get an ISO8601 representation of the current time
str_time = Clock::UTC.iso8601 # "2018-08-14T13:04:42.650Z"

# Parse a string representation of time
time = Clock.parse(str_time) # Time instance

# Convert local time to UTC
Clock::UTC.coerce(local_time) # Time instance in UTC
```

## Implementation

The `clock` interface has 2 implementations:

 - `UTC` for working with UTC time
 - `Local` for working with system local time

## Interface

Each of the implementations has the following methods:

- `now` returns the current time
- `iso8601` returns the current time as an ISO8601 time string
- `iso8601(time)` returns the given time as an ISO8601 time string
- `coerce(time)` Converts the given time to the clock's timezone
- `parse(str)` Converts a string representation of time to a time value
- `elapsed_milliseconds(start_time, end_time)` Calculates the difference in milliseconds between two times
- `timestamp` Returns the current time as a numerical float timestamp
- `timestamp(time)` Returns the given time as a numerical float timestamp

The methods of each clock are available on the instance of a clock as well as on its class.

## Utility Interface

`Clock` module can be used as a function library providing quick access to the capabilities offered by the individual clock implementations.

```ruby

time = Clock.now

str_time = Clock.iso8601
str_time = Clock.iso8601(time)

time = Clock.parse(str_time)

timestamp = Clock.timestamp
timestamp = Clock.timestamp(time)

local_time = Clock.local
local_time = Clock.local(time)

utc_time = Clock.utc
utc_time = Clock.utc(time)

milliseconds = Clock.elapsed_milliseconds(start_time, end_time)
```

## Dependency Configuration

This library was written according to [The Doctrine of Useful Objects](http://docs.eventide-project.org/user-guide/useful-objects.html). As such, it can be configured as `:clock`, and has a useful inert substitute.

```ruby
require 'clock'

class MyClass
  dependency :clock, Clock::UTC

  def self.build
    instance = new

    Clock::UTC.configure(instance)

    instance
  end
end

instance = MyClass.new

now = Clock::UTC.now # current Time
instance.clock.now = now
instance.clock.iso8601 # current Time serialized as a string
```

## License

The `clock` library is released under the [MIT License](https://github.com/obsidian-btc/clock/blob/master/MIT-License.txt).

# clock

Clock interface with support for UTC and local timezones, timezone coercion, and dependency substitution.

## Synopsis

```ruby
require 'clock'

# generate a serialized time
time = Clock::UTC.iso8601 # "2018-08-14T13:04:42.650Z"
Clock.parse(time) # Time instance in UTC

# de-serialize time
raw = Clock::UTC.now # Time instance in UTC
Clock::UTC.iso8601(raw) # "2018-08-14T13:04:42.650Z"

# convert local time to UTC
local = Clock::Local.now # Time instance according to locale
Clock::UTC.coerce(local) # Time instance in UTC

# clock with arbitrary Locale
clock = Clock::Localized.build('America/Los_Angeles')
clock.iso8601 # "2018-08-14T06:40:34-07:00"
```

## Interface

`clock` has 3 implementations of the same interface:

 - `UTC` for working with UTC time
 - `Local` for working with system local time
 - `Locale` for working with timezones in an arbitrary locale

Each of those implementations contains the following methods, in the correct timezone:

 - `now` returns the current time
 - `iso8601` returns the current time as a serialized string
 - `iso8601(Time)` returns the given time as a serialized string
 - `coerce(Time)` returns the given time in the appropriate timezone.

## Configure

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

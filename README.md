# Logwriter
Logwriter is a debug helper object of class. 
It provides a variety of format of the log output function and it will create any text file.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'logwriter'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install logwriter

## Usage

```ruby
require 'logwriter'

lw = Logwriter::Logger.new('./debuglog.log')

val = 'strings'
names = Array.new(['foo', 'bar', 'baz'])
scores = Hash[mathematics: 85, english: 70, japanese: 60]

lw.v(val)
  #=>value: "strings"

lw.v(names, 'names value')
  #=>names value: ["foo", "bar", "baz"] 

lw.v(scores, 'scores k & v')
  #=>scores k & v: {:mathematics=>85, :english=>70, :japanese=>60}


lw.c(lw)
  #=>object: #<Logwriter::Logger:0x007fdf1b05f418>, class: Logwriter::Logger, superclass: Object

lw.f(1)
  #=>/~~  1 flaged
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tomcha/logwriter. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


#!/usr/bin/env ruby

class Klass
    def hello(*args)
        "Hello " + args.join(' ')
    end
end

k = Klass.new
puts k.send("hello", "gentle", "readers")
puts k.send :hello, "gentle", "readers"

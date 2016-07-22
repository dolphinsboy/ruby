#!/usr/bin/env ruby

class HelloWorld
    Version = "1.0"
    def initialize(myname="Ruby")
        @name = myname
    end

    def hello
        print "Hello, World, I am ", @name, "\n"
    end

    def name
        return @name
    end

    def name=(value)
        @name = value
    end
end


bob = HelloWorld.new("Bob")
bob.hello

puts bob.name
bob.name = "Fuck"
puts bob.name
puts HelloWorld::Version

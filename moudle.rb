#!/usr/bin/env ruby

def test
    p FileTest.exist?("/usr/bin/ruby")
    p FileTest.size("/usr/bin/ruby")
end

module HelloModule
    Version = "1.0"
    def hello(name)
        print "Hello, ", name, ".\n"
    end

    module_function :hello
end

test

p HelloModule::Version
HelloModule::hello("Guo")

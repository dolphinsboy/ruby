#!/usr/bin/env ruby

def test
    p FileTest.exist?("/usr/bin/ruby")
    p FileTest.size("/usr/bin/ruby")
end

test

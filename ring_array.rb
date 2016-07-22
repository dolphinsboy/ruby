#!/usr/bin/env ruby

class RingArray < Array
    def [](i)
        idx = i % size
        super(idx)
    end
end

eto = RingArray["A", "B", "C", "D"]

p eto[1]
p eto[6]
p eto[10]
p eto[100]

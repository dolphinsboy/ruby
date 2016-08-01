#!/usr/bin/env ruby

def pb(i)
    printf("%08b\n", i & 0b11111111)
end

b = 0b1111000

pb(b)

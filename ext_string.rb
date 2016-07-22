#!/usr/bin/env ruby

class String

    def count_word
        ary = self.split(/\s+/)
        return ary.size
    end
end

str = "Just Another Ruby Newbice"
p str.count_word

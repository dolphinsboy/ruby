#!/usr/bin/env ruby

class Point
    attr_accessor :x, :y
    protected :x=, :y=

    def initialize(x=0.0, y=0.0)
        @x = x
        @y = y
    end

    def swap(other)
        xtmp = @x
        ytmp = @y

        @x = other.x
        @y = other.y

        other.x = xtmp
        other.y = ytmp
        self
    end

    def p_point
        p [ @x, @y ]
    end
end

p0 = Point.new
p1 = Point.new(1.0, 2.0)

p0.p_point()
p1.p_point()

p0.swap(p1)

p0.p_point()
p1.p_point()


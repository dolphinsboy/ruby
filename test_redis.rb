#!/usr/bin/env ruby

require "redis"
require "pp"

#参考资料:
#https://github.com/redis/redis-rb

def xputs(s)
    case s[0..2]
    when ">>>"
        color="29;1"
    when "[ER"
        color="31;1"
    when "[OK"
        color="32"
    when "[FA","***"
        color="33"
    else
        color=nil
    end
    
    color = nil if ENV['TERM'] != "xterm"
    print "\033[#{color}m" if color
    print s
    print "\033[0m" if color
    print "\n"
end

class ClusterNode
    def initialize(addr)
        s = addr.split(":")
        if s.length < 2
            puts "Invalid IP or Port (given as #{addr}) - use IP:Port format"
            exit 1
        end
        port = s.pop
        ip = s.join(":")
        @r = nil
        @info = {}
        @info[:host] = ip
        @info[:port] = port
        @info[:slots] = {}
        @info[:migrating] = {}
        @info[:replicate] = false
        @dirty = false
        @friends
    end
    
    #self参数返回值
    def to_s
        "#{@info[:host]}:#{@info[:port]}"
    end

    def connect(o={})
        begin
            return if @r
            print "Connting to node #{self}: "
            @r = Redis.new(:host => @info[:host], :port => @info[:port], :timeout => 60)
            @r.ping
        rescue
            xputs "[ERR] Sorry, can't connect to node #{self}"
            exit 1 if o[:abort]
            @r = nil
        end
        xputs "OK"
    end
end

node = ClusterNode.new("127.0.0.1:3050")
node.connect(:abort => true)

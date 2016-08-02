#!/usr/bin/env ruby

require "redis"
require "pp"

#参考资料:
#https://github.com/redis/redis-rb

def connect()
    r = Redis.new(:host => "127.0.0.1", :port => 3050, :db => 0)
    info = r.info()

    pp info["redis_version"]
end

connect

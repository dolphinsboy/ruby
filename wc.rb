#!/usr/bin/env ruby

ltotal = 0
wtotal = 0
ctotal = 0

ARGV.each{ |file|
    begin
        input = open(file)
        l = 0
        w = 0
        c = 0

        while line = input.gets
            l += 1
            c += line.size
            #删除行头空白
            line.sub!(/^\s+/, "")
            ary = line.split(/\s+/).size
            w += ary
        end
        input.close

        printf("%8d %8d %8s %s\n", l, w, c, file)

        ltotal += l
        wtotal += w
        ctotal += c
    rescue => ex
        print ex.message, "\n"
    end
}

printf("%8d %8d %8d %s\n", ltotal, wtotal, ctotal, "total")





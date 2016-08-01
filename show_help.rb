#!/usr/bin/env ruby

class RedisTrib

    def parse_options(cmd)
        idx = 1
        options = {}

        while idx < ARGV.length && ARGV[idx][0..1] == '--'
            if ARGV[idx][0..1] == '--'
                option = ARGV[idx][2..-1]
                idx += 1
                if ALLOWED_OPTIONS[cmd] == nil || ALLOWED_OPTIONS[cmd][option] == nil
                    puts "Unkown option '#{option}' for command '#{cmd}'"
                    exit 1
                end
                if ALLOWED_OPTIONS[cmd][option]
                    value = ARGV[idx]
                else
                    value = true
                end
                options[option] = value
            else
                break
            end
        end

        if ALLOWED_OPTIONS[cmd]
            ALLOWED_OPTIONS[cmd].each{|option, val|
                if !options[option] && val == :required
                    puts "Option '--#{option} is required " + \
                        "for subcommand '#{cmd}'"
                    exit 1
                end
            }
        end
        return options, idx
    end
end

COMMANDS = {
    "create" => ["create_cluster_cmd", -2, "host1:port1 ... hostN:portN"],
    "help" => ["help_cluster_cmd", 1, "(show this help)"]
}

ALLOWED_OPTIONS = {
    "create" => {"replicas" => true}
}

def show_help
    puts "Usage: test <commnad> <options> <arguments> ...>\n\n"

    COMMANDS.each{|k,v|
        o = ""
        puts " #{k.ljust(15)} #{v[2]}"

        if ALLOWED_OPTIONS[k]
            ALLOWED_OPTIONS[k].each{|optname, has_arg|
                puts "          --#{optname}" + (has_arg ? "<arg>" :"")
            }
        end
    }

    puts "For create test.\n"
end

if ARGV.length == 0
    show_help
    exit 1
end

cmd_sepc = COMMANDS[ARGV[0].downcase]

if !cmd_sepc
    puts "Unkown test subcommand '#{ARGV[0]}'"
    exit 1
end

rt = RedisTrib.new
cmd_options, first_non_option = rt.parse_options(ARGV[0].downcase)
p cmd_options
p first_non_option



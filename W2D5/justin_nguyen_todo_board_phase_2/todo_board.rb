require_relative "./item.rb"
require_relative "./list.rb"

class TodoBoard
    def initialize
        @list = {}
    end

    def get_command
        print "\nEnter a command: "
        cmd, target, *args = gets.chomp.split(' ')

        case cmd
        when 'ls'
            @list.keys.each { |label| puts ' ' + label }
        when 'showall'
            @list.each_value(&:print)
        when 'mklist'
            @list[target] = List.new(target)
        when 'mktodo'
            @list[target].add_item(*args)
        when 'toggle'
            @list[target].toggle_item(args[0].to_i)
        when 'rm'
            @list[target].remove_item(args[0].to_i)
        when 'purge'
            @list[target].purge
        when 'up'
            @list[target].up(*args.map(&:to_i))
        when 'down'
            @list[target].down(*args.map(&:to_i))
        when 'swap'
            @list[target].swap(*args.map(&:to_i))
        when 'sort'
            @list[target].sort_by_date!
        when 'priority'
            @list[target].print_priority
        when 'print'
            if args.empty?
                @list[target].print
            else
                @list[target].print_full_item(args[0].to_i)
            end
        when 'quit'
            return false
        else
            print "Sorry, that command is not recognized."
        end

        true
    end

    def run
        more_commands = true

        while more_commands
            more_commands = false if !self.get_command
        end
    end
end

a = TodoBoard.new
a.run
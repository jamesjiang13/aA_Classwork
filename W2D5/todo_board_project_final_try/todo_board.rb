require 'Byebug'
require_relative "list.rb"
require_relative "item.rb"

class TodoBoard
    def initialize(board_label)
        @board_label = board_label
        @board = {}     # @board[key] = value
                        # @board[list labels] = list instances
        @list = List.new(label)
        @list_name = label

        @board[@list_name] = @list

    end

    def get_command
        puts "\nEnter a command: "
        cmd, *args = gets.chomp.split

        case cmd
        when 'mktodo'
            @list.add_item(*args)      
        when 'up'
            @list.up(*args.map(&:to_i))      
        when 'down'
            @list.down(*args.map(&:to_i))
        when 'swap'
            @list.swap(*args.map(&:to_i))    # @list.swap(*["1","2","3"].map(&:to_i)) =>  
        when 'sort'                          # @list.swap(*[1,2,3]) =>
            @list.sort_by_date!              # @list.swap(1,2,3)
        when 'priority'
            @list.print_priority
        when 'toggle'
            @list.toggle_item(args[0].to_i)   
        when 'rm'
            @list.remove_item(args[0].to_i)
        when 'purge'
            @list.purge
        when 'print'
            if args.empty? 
                @list.print 
            else
                # print args
                # debugger
                @list.print_full_item(args[0].to_i) 
            end
        when 'quit'
            return false
        else
            print 'Sorry that command is not recognized'
        end
        true
    end

    def run
        get_command until get_command == false
    end



end
require_relative 'item.rb'
require 'Byebug'

class List
    # attr_writer :label
    # attr_reader :label
    attr_accessor :label


    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title, deadline, description='')
        # description ||= ''
        return false if !Item.valid_date?(deadline)
        @items << Item.new(title, deadline, description)
        true
    end

    def size
        @items.length
    end

    def valid_index?(index)
        return false if index < 0 || index > @items.length - 1
        # (0...@items.length).any? {|i| i == index }
        true
    end

    def swap(i1, i2)
        if valid_index?(i1) && valid_index?(i2)
            @items[i1],@items[i2] = @items[i2],@items[i1]
           return true
        end
        false
    end

    def [](idx)
        return nil if !valid_index?(idx)
        @items[idx]
    end

    def priority
        @items[0]
    end

    def print
        puts "| #{@label.capitalize} | "
        @items.each_with_index do |item, idx| 
            puts "#{idx.to_s.ljust(2)} | #{item.title.ljust(13)} | #{item.deadline.ljust(8)} "
        end
    end

    def print_full_item(idx)
        if valid_index?(idx)
            puts "#{idx} | #{@items[idx].title} ---- #{@items[idx].deadline}"
        end
    end

    def print_priority 
        print_full_item(0)
    end

    def up(idx, amount=1)
        if valid_index?(idx) 
            ele = @items[idx]
            amount.times { swap(@items.index(ele), @items.index(ele) - 1) if valid_index?(@items.index(ele) - 1) }
            return true
        end
        false
    end

    def down(idx,amount=1)
        if valid_index?(idx)
            ele = @items[idx] 
            amount.times { swap(@items.index(ele), @items.index(ele) + 1) if valid_index?(@items.index(ele) + 1) }
            return true
        end
        false
    end

    def sort_by_date!
        @items.sort_by! { |task| task.deadline }
    end
end

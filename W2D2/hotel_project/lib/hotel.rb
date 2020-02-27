require_relative "room"

class Hotel
    attr_reader :rooms
    def initialize(name, hash)     # (App Inn, Attic => 3, Basement => 2)
        @name = name
        @rooms = {} 
        
        hash.each do |room_name, capacity|
            @rooms[room_name] = Room.new(capacity)
        end                     # Instance of room = Room.new = 2 
    end

    def name 
        @name.split(" ").map(&:capitalize).join(" ")
    end

    def room_exists?(room_name)
        @rooms.has_key?(room_name)
    end

    def check_in(person, room_name)
        if !room_exists?(room_name)
            print 'sorry, room does not exist'
            return false
        end
            # instance       # Class f(x)  
        if @rooms[room_name].add_occupant(person) 
            print 'check in successful' 
        else
            print 'sorry, room is full'
        end
    end
    
    def has_vacancy?
        @rooms.values.any? {|room| room.available_space > 0}
    end

    def list_rooms     
        @rooms.each do |room_name, room_instance|
            puts room_name + ':' +  room_instance.available_space.to_s
        end
    end
end


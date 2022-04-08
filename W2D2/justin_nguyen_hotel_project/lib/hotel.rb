require_relative "room"

class Hotel

    attr_reader :rooms

    def initialize(name, hsh)
        @name = name
        new_hsh = {}
        hsh.each do |rooms, capacities| 
            new_hsh[rooms] = Room.new(capacities)
        end
        @rooms = new_hsh
    end

    def name
        name_arr = @name.split(" ")
        new_name = []

        name_arr.each { |word| new_name << word[0].upcase + word[1..-1].downcase}

        new_name.join(" ")
    end

    def room_exists?(name)
        return true if @rooms.has_key?(name)

        false
    end

    def check_in(person, room_name)
        exist = room_exists?(room_name)
        if !exist
            puts "sorry, room does not exist"
        else
            full = @rooms[room_name].add_occupant(person)
            if full
                puts "check in successful"
            else
                puts "sorry, room is full"
            end
        end
    end

    def has_vacancy?
        @rooms.each do |name, room_class|
            available = @rooms[name].available_space
            return true if available >= 1
        end

        false
    end

    def list_rooms
        word = ""
        @rooms.each do |name, room_class|
            puts name  + ".*" + @rooms[name].available_space.to_s
        end
    end
end

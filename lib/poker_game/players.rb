module PokerGame
  class Players
    def initialize(last_seat)
      @last_seat = last_seat
      @collection = {}
    end

    def add(player, seat_number)
      fail 'Seat number out of range!!!' unless seat_number < 0 || seat_number > last_seat
      fail 'Seat taken!!!' if @collection[seat_number]

      @collection[seat_number] = player
    end

    def find_by_id(user_id)
      collection.values.find { |player| player.user_id == user_id }.dup
    end

    def find_by_seat(seat_number)
      @collection[seat_number].dup
    end

    def modify_player(player)
      fail 'Player not found' unless find_by_id(player.user_id)

      seat_number = @collection.to_a.find do |current_seat_number, _|
        current_seat_number == seat_number
      end.first

      @collection[seat_number] = player
    end
  end
end

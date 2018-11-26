class Karaoke

  attr_reader :name, :rooms, :fee, :total_cash

  def initialize(name, rooms, fee, total_cash)
    @name = name
    @rooms = rooms
    @fee = fee
    @total_cash = total_cash
  end

  def entry(guest)
    room = rooms.find {|room| room.has_vacancy}
    if !room
      return false
    end
    money = guest.request_money(fee)
    @total_cash += money
    room.check_in_guest(guest)
    return true
    # for room in rooms
    #   if (room.has_vacancy)
    #     money = guest.request_money(fee)
    #     @total_cash += money
    #     room.check_in_guest(guest)
    #     return true
    #   end
    # end
    # return false
  end


end

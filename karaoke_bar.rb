class KaraokeBar

  attr_reader :name, :room, :capacity, :lobby, :fee, :total_cash


  def initialize(name, room, capacity, fee, total_cash)
    @name = name
    @room = room
    @capacity = capacity
    @lobby = []
    @fee = fee
    @total_cash = total_cash
  end

  def guest_into_lobby(guest, fee)
    @lobby << @guest
    @guest.pay_fee()
    @karaoke_bar.total_cash += @fee
  end

end

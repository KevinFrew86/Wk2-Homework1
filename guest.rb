class Guest

  attr_reader :name, :cash, :genre

  def initialize(name, cash, genre)
    @name = name
    @cash = cash
    @genre = genre
  end

  def request_money(fee)
    @cash -= fee
    return fee
  end

end

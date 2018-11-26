require('MiniTest/autorun')
require('MiniTest/rg')
require_relative('../guest.rb')

class GuestTest < MiniTest::Test

  def setup()
    @guest = Guest.new("Rab", 1000, "90s")
  end

  def test_guest_has_name
    assert_equal("Rab", @guest.name)
  end

  def test_guest_has_cash
    assert_equal(1000, @guest.cash)
  end

  def test_guest_has_fav_decade
    assert_equal("90s", @guest.genre)
  end

  def test_request_money()
    @money = @guest.request_money(200)
    assert_equal(800, @guest.cash)
    assert_equal(200, @money)
  end


end

require('minitest/autorun')
require('minitest/rg')
require_relative('../karaoke_bar.rb')
require_relative('../guest.rb')
require_relative('../rooms.rb')
require_relative('../song.rb')


class KaraokeBarTest < MiniTest::Test

  def setup()
    @room_1 = Room.new("Room 1", 0, @room_1_list)
    @room_2 = Room.new("Room 2", 0, @room_2_list)
    @room_3 = Room.new("Room 3", 0, @room_3_list)

    @karaoke_bar = KaraokeBar.new("Kev's Krazy Kyoto Karaoke", 3, 60, 5, 50000)

  end


  def test_bar_has_name()
    assert_equal("Kev's Krazy Kyoto Karaoke", @karaoke_bar.name())
  end

  def test_guest_into_lobby(@guest_1, @fee)
    @lobby.guest_into_lobby()
    assert_equal(1, @lobby.count)
  end

  def test_fee_is_paid(@guest_1, @fee)
    @total_cash.guest_into_lobby()
    @guest_1.guest_into_lobby()
    assert_equal(50500, @total_cash)
    assert_equal(500, @guest_1.cash)
  end

  def test_guest_leaves_lobby_when_enters_room()
    assert_equal(0, @lobby.count)
  end

end

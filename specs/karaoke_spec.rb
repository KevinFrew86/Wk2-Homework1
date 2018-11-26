require('minitest/autorun')
require('minitest/rg')
require_relative('../karaoke.rb')
require_relative('../guest.rb')
require_relative('../room.rb')
# require_relative('../song.rb')


class KaraokeTest < MiniTest::Test

  def setup()
    @guest = Guest.new("Rab", 1000, "90s")
    @room_with_vacancy = Room.new("Room 1", [], 5, [])
    @room_at_capacity = Room.new("Room 3", [@guest], 1, [])
    @karaoke = Karaoke.new("KKKK", [@room_at_capacity, @room_with_vacancy], 500, 0)
    @karaoke_with_no_capacity = Karaoke.new("no capacity", [@room_at_capacity], 500, 0)
  end


  def test_karaoke_has_name
    assert_equal("KKKK", @karaoke.name)
  end

  def test_karaoke_has_room
    assert_equal([@room_at_capacity, @room_with_vacancy], @karaoke.rooms)
  end

  def test_karaoke_has_entry_fee
    assert_equal(500, @karaoke.fee)
  end

  def test_karaoke_has_total_cash
    assert_equal(0, @karaoke.total_cash)
  end

  def test_karaoke_entry_takes_fee
    @karaoke.entry(@guest)
    assert_equal(500, @karaoke.total_cash)
    assert_equal(500, @guest.cash)
  end

  def test_karaoke_entry_adds_guest_to_room_with_vacancy
    @karaoke.entry(@guest)
    assert_equal([@guest], @room_with_vacancy.occupants)
  end

  def test_karaoke_entry_when_guest_can_enter_returns_true
    assert_equal(true, @karaoke.entry(@guest))
  end

  def test_karaoke_entry_when_guest_cannot_enter_returns_false
    assert_equal(false, @karaoke_with_no_capacity.entry(@guest))
  end

end

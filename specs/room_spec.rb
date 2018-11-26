require('minitest/autorun')
require('minitest/rg')
require_relative('../room.rb')
require_relative('../guest.rb')
require_relative('../song.rb')


class RoomTest < MiniTest::Test

  def setup()

    @room = Room.new("Room 1", [], 5, [])
    @guest = Guest.new("Rab", 1000, "90s")
    @song = Song.new("Pop", "Abba", "Dancing queen")
    @room_with_guest = Room.new("Room 2", [@guest], 5, [])
    @room_at_capacity = Room.new("Room 3", [@guest], 1, [])

  end

  def test_room_has_name
    assert_equal("Room 1", @room.name)
  end

  def test_room_has_occupants
    assert_equal(0,
      @room.occupants.count)
  end

  def test_room_has_capacity()
    assert_equal(5, @room.capacity)
  end

  def test_room_has_song_list
    assert_equal(0,
      @room.song_list.count)
  end

  def test_room_check_in_guest()
    @room.check_in_guest(@guest)
    assert_equal([@guest], @room.occupants)
  end

  def test_room_check_out_guest()
    @room_with_guest.check_out_guest(@guest)
    assert_equal([], @room_with_guest.occupants)
  end

  def test_room_add_song()
    @room.add_song(@song)
    assert_equal([@song], @room.song_list)
  end

  def test_room_has_vacancy
    assert_equal(false, @room_at_capacity.has_vacancy)
    assert_equal(true, @room.has_vacancy)
  end

end

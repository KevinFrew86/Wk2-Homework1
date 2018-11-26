require('minitest/autorun')
require('minitest/rg')
require_relative('../song.rb')


class SongTest < MiniTest::Test

  def setup()

    @song = Song.new("Rock", "Bruce Springsteen", "Born to run")

  end

  def test_song_has_genre
    assert_equal("Rock", @song.genre)
  end

  def test_song_has_artist
    assert_equal("Bruce Springsteen", @song.artist)
  end

  def test_song_has_title
    assert_equal("Born to run", @song.title)
  end

end

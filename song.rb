class Song

  attr_reader :genre, :artist, :title

  def initialize(genre, artist, title)
    @genre = genre
    @artist = artist
    @title  = title
  end

end

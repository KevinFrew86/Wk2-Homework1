class Room

  attr_reader :name, :occupants, :capacity, :song_list

  def initialize(name, occupants, capacity, song_list)
    @name = name
    @occupants = occupants
    @capacity = capacity
    @song_list = song_list
  end


  def check_in_guest(guest)
    @occupants << guest
  end

  def check_out_guest(guest)
    @occupants.delete(guest)
  end

  def add_song(song)
    @song_list << song
  end

  def has_vacancy
    return occupants.count < capacity
  end

end

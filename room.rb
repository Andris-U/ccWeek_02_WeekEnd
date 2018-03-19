
class Room
  attr_accessor :guests, :songs, :max_guests

  def initialize guests, available_songs, songs = nil,
    @guests = guests
    @available_songs = available_songs
    @songs = songs ||= []
    @max_guests = 3
  end

  def check_in new_guest
    if @guests.count < @max_guests && new_guest.money >= 10
      @guests.push(new_guest)
      new_guest.make_payment(10)
      if check_if_favourite_song_present new_guest
        new_guest.cheer_favourite_song
      end
    else
      p "The room is already full!"
    end
  end

  def check_if_favourite_song_present guest
    @songs.each do |song|
      if song.name == guest.favourite_song
        return true
      end
    end
  end

  def check_out name
    if !@guests.empty?
      @guests.each do |guest|
        if guest.name == name
          @guests.delete(guest)
        end
      end
    else
      p "No such guest in the room."
    end
  end

  def find_song_by_title title
    @room.available_songs.each do |song|
      if song.name == title
        return song
      end
    end
  end

  def song_available? title
    @available_songs.each do |song|
      if song.name == title
        return true
      end
    end
    return false
  end

  def add_song title, buyer
    song_price = @room.find_song_by_title(title).price
    if @room.song_available?(title) && @buyer.has_enough_funds?(song_price)
      @room.songs.push(@room.find_song_by_title(title))
    end
  end
end

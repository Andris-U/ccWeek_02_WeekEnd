require('minitest/autorun')
require('minitest/rg')
require_relative('../room')
require_relative('../guest')
require_relative('../song')

class RoomTest < Minitest::Test

  def setup
    @songs = [Song.new('Hey Joe'), Song.new('Ave Maria')]
    @other_songs = [Song.new('Thunderstruck'), Song.new('The Trooper'),
       Song.new('Conga')]

    @guest1 = Guest.new('Joe', 40, 'Hey Joe')
    @guest2 = Guest.new('Maria', 20, 'Ave Maria')
    @guest3 = Guest.new('Ricardo', 30, 'Conga')
    @guest4 = Guest.new('James', 15, 'Killer Queen')

    @room = Room.new([@guest1, @guest2], @other_songs, @songs )
    # @room2 = Room.new([@guest1, @guest2], @other_songs)
  end

  def test_check_in_guest
    @room.check_in(@guest4)
    assert_equal(3, @room.guests.count)
  end

  def test_guest_pays_entry
    @room.check_in(@guest4)
    assert_equal(5, @guest4.money)
  end

  def test_check_out_guest_by_name
    @room.check_out('Joe')
    assert_equal(false, @room.guests.include?(@guest1))
  end

  def test_add_new_song
    @room.add_song('Metropolis Pt 1', @guest1)
    assert_equal(4, @room.songs.count)
  end

  def test_guests_cheer_favourite_song_on_entering_room
    assert_equal('Fuck yeah! Ave Maria!', @room.check_in(@guest2))
  end


end


class Guest
  attr_accessor :name, :money, :favourite_song

  def initialize name, money, favourite_song
    @name = name
    @money = money
    @favourite_song = favourite_song
  end

  def cheer_favourite_song
    p "Fuck yeah! #{favourite_song}!"
  end

  def make_payment amount
    @money -= amount
  end

  def has_enough_funds? amount
    @money >= amount ? return true : return false
  end

end

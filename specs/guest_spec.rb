require('minitest/autorun')
require('minitest/rg')
require_relative('../room')
require_relative('../guest')
require_relative('../song')

class GuestTest < Minitest::Test

  def setup
    @guest1 = Guest.new('Joe', 40, 'Hey Joe')
    @guest2 = Guest.new('Maria', 20, 'Ave Maria')
    @guest3 = Guest.new('Ricardo', 30, 'Conga')
    @guest4 = Guest.new('James', 15, 'Killer Queen')
  end

  def test_cheer_favourite_song
    assert_equal('Fuck yeah! Ave Maria!', @guest2.cheer_favourite_song)
  end

  def test_make_payment
    @guest1.make_payment(10)
    assert_equal(30, @guest1.money)
  end

end

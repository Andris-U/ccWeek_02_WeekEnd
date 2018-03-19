
class Song
  attr_accessor :name, :price

  def initialize name, price = nil
    @name = name
    @price = price ||= 5
  end
end

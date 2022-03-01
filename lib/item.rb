
class Item
  attr_reader :name, :price, 

  def initialize(item_hash)
    @name = item_hash[:name]
    @price = item_hash[:price]
  end
end

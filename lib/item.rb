
class Item
  attr_reader :name, :price, :count
  def initialize(item_hash)
    @name = item_hash[:name]
    @price = item_hash[:price]
    @count = item_hash[:count]
  end
end

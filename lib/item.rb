class Item
  attr_reader :name, :price

  def initialize(attributes)
    @name = attributes[:name]
    @price = attributes[:price].delete_prefix("$").to_f
  end
end

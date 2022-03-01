class Vendor
  attr_reader :name, :inventory
  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    stock = @inventory[item]
  end

  def stock(item, num_items)
    @inventory[item] += num_items
  end
end

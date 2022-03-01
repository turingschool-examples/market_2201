class Vendor
  attr_reader :name, :inventory
  def initialize(vendor)
    @name = vendor
    @inventory = Hash.new(0)
  end


  def stock(item, quantity)
    inventory[item] = quantity
  end

  def check_stock(item)
    inventory[item]
  end
end

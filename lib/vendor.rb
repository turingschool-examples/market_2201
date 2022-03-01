class Vendor
  attr_reader :name
  attr_accessor :inventory
  def initialize(vendor)
    @name = vendor
    @inventory = Hash.new(0)
  end


  def stock(item, quantity)
    inventory.keys.include?(item) ?
    inventory[item] += quantity :
    inventory[item] = quantity
  end

  def check_stock(item)
    inventory[item]
  end

  def potential_revenue
    @inventory.map {|item, quantity| item.price[1..-1].to_f * quantity}.sum.round(2)
  end
end

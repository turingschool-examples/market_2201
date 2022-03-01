class Vendor
  attr_reader :name,
              :inventory
  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    @inventory[item.to_s]
  end

  def stock(item, quantity)
    @inventory[item.to_s] += quantity
  end
end

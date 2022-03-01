require './lib/item'

class Vendor
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    return 0 if !@inventory.keys.include?(item)
    @inventory[item]
  end

  def stock(item, amount)
    if !@inventory.keys.include?(item)
      @inventory[item] = 0
    end
    @inventory[item] += amount
  end



end

require './lib/item.rb'

class Vendor
  attr_accessor :name, :inventory
  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    if @inventory.key?(item)
      return inventory[item]
    else
      return 0
    end
  end

  def stock(item, quantity)
    if @inventory.key?(item)
      temp_quantity = inventory[item]
    else
      temp_quantity = 0
    end
    @inventory[item] = quantity + temp_quantity
  end

  def potential_revenue
    money = 0.0
    inventory.each do |item|
      money += item[1] * item[0].price
    end
    return money
  end
end

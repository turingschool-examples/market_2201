require './item'

class Vendor
  attr_reader :name, :inventory
  def initialize (name)
    @name = name
    @inventory = {}
  end

  def check_stock (item)
    # key_to_check = item.name.to_sym
    @inventory[item] ? @inventory[item] : 0
  end

  def stock (item, quantity)
    @inventory[item] ? @inventory[item] += quantity : @inventory[item] = quantity
  end
  
end

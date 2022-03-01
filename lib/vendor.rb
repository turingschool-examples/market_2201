class Vendor
  attr_reader :name, :inventory
  
  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    if inventory.include?(item)
      return inventory[item]
    else
      return 0
    end
  end

  def stock(item, count)
    inventory[item] = count
  end
end
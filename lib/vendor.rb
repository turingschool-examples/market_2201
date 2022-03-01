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
    if !inventory.include?(item)
      inventory[item] = count
    else
      inventory[item] += count
    end
  end
end
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

  def potential_revenue
    potential = 0
    inventory.each do |item|
      price_calcable = item[0].price.split("")
      price_calcable.shift
      potential += price_calcable.join("").to_f * item[1]
    end
    return potential
  end
end
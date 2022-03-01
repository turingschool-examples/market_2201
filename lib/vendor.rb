require_relative 'item'

class Vendor

  attr_reader :name, :inventory
  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(checked_item)
    if @inventory.include?(checked_item)
      @inventory[checked_item]
    else
      return 0
    end
  end

  def stock(item, amount)
    if @inventory.include?(item)
      @inventory[item] += amount
    else
      @inventory[item] = amount
    end
  end

  def potential_revenue
    potential_revenue = 0
    @inventory.each_pair{|key, value| potential_revenue += key.price.delete('$').to_f * value}
    return potential_revenue
  end
end

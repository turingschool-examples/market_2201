require './lib/item'

class Vendor

  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    if @inventory.has_key?(item)
      @inventory[item]
    else
      return 0
    end
  end

  def stock(item, amount)
    @inventory[item] += amount
  end

  def potential_revenue
    item_potential_revenue = []
    @inventory.each do |item, quantity|
      item_potential_revenue << item.price * quantity

    end
    item_potential_revenue.sum

  end


end

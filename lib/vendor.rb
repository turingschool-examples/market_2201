require_relative 'item'

class Vendor
  attr_reader :inventory, :name
  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(given_item)
    amount = 0
    if @inventory[given_item]
      amount += @inventory[given_item]
    end
    amount
  end

  def stock(item, amount)
    stock = check_stock(item)
    @inventory[item] = stock
    @inventory[item] += amount
    @inventory[item]
  end

  def potential_revenue
    total_revenue = 0
    @inventory.each do |item, amount|
      price = item.price.delete("$")
      price_float = price.to_f
      total_revenue += (price_float) * amount
    end
    total_revenue.round(2)
  end
end

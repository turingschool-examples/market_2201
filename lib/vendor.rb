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
end

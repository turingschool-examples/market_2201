require './lib/item'

class Vendor
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    @inventory[item]
  end

  def stock(item, quantity)
    @inventory[item] += quantity
  end

  def potential_revenue
    total = 0
    @inventory.each do |item|
      total +=  item[1] * item[0].price
      # require "pry"; binding.pry
    end
    total
  end


end

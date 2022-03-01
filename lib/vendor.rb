require 'pry'



class Vendor

  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def stock(item, quantity)
    inventory[item] += quantity
  end

  def check_stock(item)
    inventory[item]
  end


  def potential_revenue
    revenue_per_item = inventory.map do |item,quantity|
      item.price * quantity
    end
    revenue_per_item.sum
  end


end

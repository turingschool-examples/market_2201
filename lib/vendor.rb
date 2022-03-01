require 'pry'
require './item'

class Vendor
  attr_reader :name, :inventory

  def initialize(name, inventory = Hash.new(0))
    @name = name
    @inventory = inventory
  end

  def stock(item, quantity)
    @inventory[item] += quantity
  end

  def check_stock(item)
    @inventory[item]
  end

  def potential_revenue
    revenue = 0.0
    @inventory.each do |name, quantity|
      revenue += (name.price * quantity.to_f)
    end
    revenue
  end

end

require './lib/item'
require "pry"

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
    pr = 0
    @inventory.each do |item, quantity|
      pr += (item.price * quantity)
    end
    pr
  end

end

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
end

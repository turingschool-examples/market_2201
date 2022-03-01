require 'pry'

class Vendor
  attr_reader :name, :inventory, :item_quantity

  def initialize(name)
    @name = name
    @inventory = {}
    @item_quantity = 0
  end

  def check_stock(item)
    @item_quantity
  end

  def stock(item, item_quantity)
    if @inventory[item]
      @inventory[item] << item_quantity
    else
      @inventory[item] = item_quantity
    end
    @item_quantity += item_quantity
  end

end

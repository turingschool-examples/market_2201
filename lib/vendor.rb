require 'pry'
require './lib/item'

class Vendor
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    if item.class == Item
      c = 0
      @inventory.keys.each do |items|
        if items.name == item.name
          c += 1
        end
      end
      if c > 0
        @inventory.each do |key, value|
          if key.name == item.name
            return value
          end
        end
      else
        return c
      end
    else
      return 0
    end
  end

  def stock(item, quant)
    @inventory[item] = quant
  end

end

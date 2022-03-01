require './lib/vendor.rb'
require './lib/item.rb'
require 'pry'

class Market
  attr_accessor :name, :vendors
  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    vendors.push(vendor)
  end

  def vendors_names
    vendors_names_array = []
    vendors.each do |vendor|
      vendors_names_array.push(vendor.name)
    end
    return vendors_names_array
  end

  def vendors_that_sell(item_to_check)
    vendors_that_sell_array = []
    vendors.each do |vendor|
      vendor.inventory.each do |item|
        if item[0] == item_to_check
          vendors_that_sell_array.push(vendor)
        end
      end
    end
    return vendors_that_sell_array
  end

  def total_inventory
    # total_inventory_hash=Hash.new({[quantity:] = 0, [vendors:] = [])
     total_inventory_hash=Hash.new
     vendors.each do |vendor|
       vendor.inventory.each do |item|
          if total_inventory_hash.key?(item[0])
         else
          total_inventory_hash[item[0]] = {:quantity => item[1], :vendors => vendors_that_sell(item[0])}
         end
       end
     end

  end

  def overstocked_items
    overstocked_items_array = []
    vendors.each do |vendor|
      vendor.inventory.each do |item|
        if item[1] > 50
          overstocked_items_array.push(item[0])
        end
      end
    end
    return overstocked_items_array
  end
end

require 'pry'
require './item'
require './vendor'

class Market
  attr_reader :name, :vendors

  def initialize(name, vendors = [])
    @name = name
    @vendors = vendors
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(item)
    @vendors.find_all do |vendor|
      vendor.check_stock(item) > 0
    end
  end

  def total_inventory
    inventory_hash = {}
    @vendors.each do |vendor|
      vendor.inventory.each do |item, num_in_stock|
        v = vendors_that_sell(item)
        num_in_stock +=
        if inventory_hash[item] == nil
          inventory_hash[item] = {quantity: num_in_stock, vendors: v}
        end
      end
    end
    inventory_hash
  end

  def overstocked_items
    items = []
    @vendors.each do |vendor|
      vendor.inventory.each do |item, num_in_stock|
        binding.pry
        array << item if vendors_that_sell(item).count > 1 && total_inventory[item][:quantity] > 50
      end
    end
    items
  end

  def sorted_item_list
    names = []
    @vendors.each do |vendor|
      vendor.inventory.each do |item, num_in_stock|
        names << item.name if names.include?(item.name) == false
      end
    end
    names.sort
  end

end

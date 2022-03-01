require 'pry'
require './lib/item'
require './lib/vendor'

class Market

  attr_reader :name,
              :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map {|vendor| vendor.name}
  end

  def vendors_that_sell(item)
    @vendors.find_all {|vendor| vendor.inventory.has_key?(item)}
  end

  def sorted_item_list
    items = @vendors.flat_map do |vendor|
      vendor.inventory.keys
    end.uniq
    item_names = items.map {|item| item.name}
    item_names.sort
  end

  def total_inventory
    total_inventory_hash = Hash.new({quantity: 0, vendors: []})
    @vendors.each do |vendor|
      vendor.inventory.each do |item, quantity|
        total_inventory_hash[item] = {
          quantity: 0,
          vendors: vendors_that_sell(item)
        }
      end
    end
    @vendors.each do |vendor|
      vendor.inventory.each do |item, quantity|
        total_inventory_hash[item][:quantity] += quantity
      end
    end
    total_inventory_hash
  end

  def overstocked_items
    overstocked_items = @vendors.flat_map do |vendor|
      vendor.inventory.select do |item, quantity|
        total_inventory[item][:quantity] > 50 && vendors_that_sell(item).count > 1
      end.keys
    end.uniq
    overstocked_items
  end

end

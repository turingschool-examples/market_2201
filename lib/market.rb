require './lib/vendor'

class Market
  attr_reader :name, :vendors

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
    @vendors.select{|vendor| vendor.inventory.include?(item)}
  end

  def total_inventory
    inventory = {}
    @vendors.each do |vendor|
      vendor.inventory.each do |item, quantity|
        if !inventory.keys.include?(item)
          inventory[item] = {quantity: 0, vendors: []}
        end
      end
    end
    inventory.each do |item, info|
      vendors_that_sell(item).each do |vendor|
        info[:vendors] << vendor
        info[:quantity] += vendor.inventory[item]
      end
    end
    inventory
  end

end

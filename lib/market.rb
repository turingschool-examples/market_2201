require_relative 'vendor'

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
    @vendors.find_all do |vendor|
      inventory = vendor.inventory
      inventory.include?(item)
    end
  end
  #this next method is pretty darn long, but heck, I'm hype that it works
  def total_inventory
    inventory = {}
    items = @vendors.map do |vendor|
      vendor.inventory.keys
    end.flatten.uniq!
    items.map do |item|
      inventory[item] = {quantity: 0, vendors: vendors_that_sell(item)}
    end
    inventory.each do |item, traits|
      vendors = vendors_that_sell(item)
      vendors.each {|vendor| traits[:quantity] += vendor.inventory[item]}
    end
    inventory
  end

  def overstocked_items
    overstocked = []
    total_inventory.each do |item, traits|
      overstocked << item if traits[:quantity] >= 50
    end
  end
end

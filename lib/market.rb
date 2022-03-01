require './lib/vendor'
require './lib/item'

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
    @vendors.select {|vendor| vendor.check_stock(item) > 0}
  end

  def total_inventory
    tot_inventory = Hash.new
    @vendors.each do |vendor|
      tot_inventory[vendor] = vendor.inventory
    end
    tot_inventory
  end

end

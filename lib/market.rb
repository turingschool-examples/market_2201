require 'pry'

class Market
  attr_reader :name, :vendors, :vendor_names

  def initialize(name)
    @name = name
    @vendors = []
    @vendor_names = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.each do |vendor|
      @vendor_names << vendor.name
    end
  end

  def vendors_that_sell(item)
    @vendors.map do |vendor|
      vendor.stock(item, item_quantity)
    end
    inventory.find_all do |items|
      stock.item_quantity > 0
    end
  end
end

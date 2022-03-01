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

end

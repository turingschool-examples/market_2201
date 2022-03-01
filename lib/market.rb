require './lib/item'
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
    @vendors.map { |vendor| vendor.name}
  end

  def vendors_that_sell(item)
    vendors_that_sell = []
    @vendors.each do |vendor|
      if vendor.inventory.include?(item)
        vendors_that_sell << vendor
      end
    end
    vendors_that_sell
  end

  def sorted_item_list
    list = []
    @vendors.each do |vendor|
      vendor.inventory.each do |item, quantity|
        if list.include?(item.name) == false
          list << item.name
        else
        end
      end
    end
    # binding.pry
    list.sort
  end

  def overstocked_items
    binding.pry
    # overstocked_items = []
    # total_inventory
    # ti.each do |item, attributes|
    #   attributes.each do |k, v|
    # 
  end

  def total_inventory
    # binding.pry
    ti = {}
    @vendors.each do |vendor|
      vendor.inventory.each do |item, quantity|
        ti[item] = quantity
      end
    end
    ti
  end

end

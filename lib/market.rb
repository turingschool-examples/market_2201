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
    vendors_that_have_item = []
    @vendors.find_all do |vendor|
      if vendor.inventory.include?(item)
        vendors_that_have_item << vendor
      end
    end
  end

  def total_inventory
    total_inventory_hash = {}
    sub_hash= Hash.new(0)
    @vendors.map do |vendor|
      vendor.inventory.keys.each do |item|
        total_inventory_hash[item]
      end
    end

    @vendors.map do |vendor|
      vendor.inventory.map do |item, quantity|

        sub_hash[item] += quantity

      end
    end

    sub_hash[:vendors] = []
    @vendors.map do |vendor|
      vendor.inventory.keys.map do |item|
        if vendor.inventory.keys.include?(item)
          sub_hash[:vendors] << vendor
        end
      end
      end
      require "pry"; binding.pry
      sub_hash
    end

end

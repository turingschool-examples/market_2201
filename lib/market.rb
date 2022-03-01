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

end

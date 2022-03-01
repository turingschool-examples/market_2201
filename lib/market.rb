class Market
  attr_accessor :name, :vendors
  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    vendors << vendor
  end

  def vendor_names
    vendor_names = []
    vendors.each do |vendor|
      vendor_names << vendor.name
    end
    vendor_names
  end

  def vendors_that_sell(item)
    vendors_by_item = []
    vendors.each do |vendor|
      if vendor.inventory.include?(item)
        vendors_by_item << vendor
      end
    end
  end
end

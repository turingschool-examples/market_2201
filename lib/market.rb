class Market
  attr_reader :name,
              :vendors

  def initialize(name)
    @name = name
    @vendors = Array.new
  end

  def add_vendor(new_vendor)
    @vendors << new_vendor
  end

  def vendor_names
    names = @vendors.map { |vendor| vendor.name }
    names
  end

  def vendors_that_sell(item)
    in_stock = Array.new
    @vendors.each do |vendor|
      if vendor.inventory.include?(item)
        in_stock << vendor
      end
    end
    in_stock
  end

  def total_inventory
    #hard stuck on this one 
    tinv = {}
    @vendors.each do |vendor|
      vendor.inventory.map do |item|
        item[0].info
      end
    end
  end
end

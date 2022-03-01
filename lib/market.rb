class Market
  attr_reader :name, :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    if !vendors.include?(vendor)
      vendors << vendor
    end
  end

  def vendor_names
    names = []
    vendors.each do |vendor|
      names << vendor.name
    end
    return names
  end

  def vendors_that_sell(item)
    vendors.find_all { |vendor| vendor.inventory.include?(item)}
  end

  def total_inventory
    market_inventory = {}
    vendors.each do |vendor|
      vendor.inventory.each do |item|
        if !market_inventory.include?(item[0])
          market_inventory[item[0]] = {}
          market_inventory[item[0]][:quantity] = item[1]
          market_inventory[item[0]][:vendors] = [vendor]
        else
          market_inventory[item[0]][:quantity] += item[1]
          market_inventory[item[0]][:vendors] << vendor
        end
      end
    end
    return market_inventory
  end

end
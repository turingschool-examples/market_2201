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

  def overstocked_items
    overstocked_inv = total_inventory.find_all {|item| item[1][:quantity] > 50 && item[1][:vendors].count > 1}
    overstocked_items = []
    overstocked_inv.each do |inv| 
      overstocked_items << inv[0] 
    end
    return overstocked_items
  end

  def sorted_items_list
    inv = total_inventory
    items = []
    inv.each do |inv_item|
      items << inv_item[0].name
    end
    items.sort
  end
end
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
    @vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(item)
    @vendors.find_all { |vendor| vendor.inventory.has_key?(item) }
  end

  def sorted_item_list
    sorted_item_list = []
    @vendors.each do |vendor|
      vendor.inventory.each do |item|
        item.each do |item|
          sorted_item_list << item.name if item.class == Item
        end
      end
    end
    sorted_item_list.sort.uniq
  end

  def overstocked_items
    overstocked_items = []
    items_over_100 = []
    overstock_hash = {}
    @vendors.each do |vendor|
      vendor.inventory.each do |item, count|
        overstock_hash[item] = count if !overstock_hash.has_key?(item)
        overstock_hash[item] += count
      end
    end
    items_over_100 << overstock_hash.find_all { |item, count| count > 100 }
    overstocked_items << items_over_100[0].flatten[0]
  end

  def total_inventory
    total_inventory = {}
    @vendors.each do |vendor|
      vendor.inventory.each do |item, count|
        total_inventory[item] = count if !total_inventory.has_key?(item)
        total_inventory[item] += count
      end
    end
    total_inventory
  end
end

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
    @vendors.map{|vendor| vendor.name}
  end

  def vendors_that_sell(item)
    @vendors.find_all{|vendor| vendor.inventory.keys.include?(item)}
  end

  def total_inventory
    merchants = Hash.new
    @vendors.each { |vendor| merchants[vendor.inventory] = vendor.inventory }
    # items_hash =
    # items.merge{|item, count| count += count}
    binding.pry
  end

  def overstocked_items
    overstocked = []
    item_count = Hash.new(0)
    vendors_items = @vendors.map {|vendor| vendor.inventory}
    all_items = vendors_items.map {|item| item.keys}.flatten
    all_items.each {|item| item_count[item] += 1 }
    item_count.each {|item, count| overstocked << item if count > 1 }

    overstocked
    # binding.pry
  end

  def sorted_item_list
    all_items = @vendors.map {|vendor| vendor.inventory}
    all_items = all_items.map {|item| item.keys}.flatten
    all_items.map {|item| item.name}.uniq.sort
    # binding.pry
  end
end

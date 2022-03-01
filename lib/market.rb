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
    @vendors.map(&:name)
  end

  def vendors_that_sell(item)
    @vendors.select { |vendor| vendor.inventory.has_key?(item) }
  end

  def items
    @vendors.map do |vendor|
      vendor.items
    end.flatten.uniq
  end

  def sorted_item_list
    @vendors.map do |vendor|
      vendor.items.map(&:name)
    end.flatten.uniq.sort
  end

  def total_inventory
  end
end

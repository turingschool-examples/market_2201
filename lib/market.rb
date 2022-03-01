class Market
  attr_reader :name, :vendors

  def initialize(name)
    @name=  name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.each do |name|
      name.name
    end
  end

  def vendors_that_sell(item1)
    @vendors.each do |item|
    end
  end

  def potential_revenue
  end

  def total_inventory
  end

  def overstocked_items
  end

  def sorted_item_list
  end
end

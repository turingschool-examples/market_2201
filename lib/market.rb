class Market
attr_reader :name, :vendors
  def initialize(name)
    @name = name
    @vendors = []
    @total_inventory = {}
  end

  def add_vendor(vendor)
    @vendors << vendor
  end
  def vendor_names
    # require "pry"; binding.pry
    @vendors.map do |vendor|
      vendor.name
    end 
  end
  def vendors_that_sell(item)
    @vendors.find_all do |vendor|
      vendor.inventory.key?(item)
    end 
  end
  
  
  def total_inventory
    @vendors.each do |vendor|
      vendor.inventory.each do |item|
        @total_inventory[item] = {quantity: vendor.check_stock(item)} 
        require "pry"; binding.pry
      end 
    end 
  end
  
  # def overstocked_items
  #   total_inventory.each do |item|
  #     item.find_all (quantity > 50 && vendors.count > 1)
  #   end 
  # end 
  # 

end 

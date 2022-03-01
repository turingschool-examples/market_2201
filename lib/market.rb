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

  # def total_inventory
  #   total_inventory = {}
  #   @vendors.each do |vendor|
  #     vendor.inventory.each do |item|
  #       if
  #     require "pry"; binding.pry
  #     end
  #   end
  #   total_inventory
  #   # require "pry"; binding.pry
  # end
end

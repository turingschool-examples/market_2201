require 'pry'


class Market

  attr_reader :name, :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    vendors << vendor
  end

  def vendor_names
    vendors.map {|vendor| vendor.name }
  end

  def vendors_that_sell(item)
    vendors.find_all do |vendor|
      vendor if vendor.inventory.include?(item)
    end
  end

  # def total_inventory
  #   total_inventory = Hash.new(0)
  #   total_inventory_stock = Hash.new(0)
  #   stock_vendors =[]
  #   vendors.map do |vendor|
  #     vendor.inventory.map do |item,stock|
  #       if total_inventory[item] == 0
  #       total_inventory[item] = {
  #         total_inventory_stock[:quantity] += stock,
  #         stock_vendors << vendors}
  #       else
  #         total_inventory[item]
  #     end
  #   end
  # end

  # def overstocked_items
  #
    # num = []
    # count = 0
    # vendors.map do |vendor|
    #   vendor.inventory.each do |item|
    #     vendors_that_sell(item).each do |vendor|
    #       num << vendor.check_stock(item)
    #     end
    #     if vendors_that_sell(item).count > 1 && num.sum > 50
    #       vendor
    #     end
    #   end
    # end
  # end

end

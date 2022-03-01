require './lib/vendor'

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
    @vendors.map {|vendor| vendor.name}
  end

  def vendors_that_sell(item)
    @vendors.select{|vendor| vendor.inventory.include?(item)}
  end

  def total_inventory
    inventory = {}
    @vendors.each do |vendor|
      vendor.inventory.each do |item, quantity|
        if !inventory.keys.include?(item)
          inventory[item] = {quantity: 0, vendors: []}
        end
      end
    end
    inventory.each do |item, info|
      vendors_that_sell(item).each do |vendor|
        info[:vendors] << vendor
        info[:quantity] += vendor.inventory[item]
      end
    end
    inventory
  end

  def overstocked_items
    overstock = []
    total_inventory.each do |item, info|
      if info[:quantity] > 50 && info[:vendors].count > 1
        overstock << item
      end
    end
    overstock
  end

  def sorted_item_list
    total_inventory.keys.map {|item| item.name}.sort
  end

  def sell(item, quantity)
    if !total_inventory.keys.include?(item)
      return false
    elsif total_inventory[item][:quantity] < quantity
      return false
    else
      # until sold = quantity
      #   vendors_that_sell(item).each do |vendor|
      #   if vendor.inventory[item] > quantity
      #     amount_sold = (vendor.inventory[item] -= quantity)
      #     sold += amount_sold
      #     vendor.inventory[item] -= quantity
      #   else
      #     vendor.inventory[item] = 0
      #     sold += vendor.inventory[item]
      #   end
      # end
      return true
    end
  end
end

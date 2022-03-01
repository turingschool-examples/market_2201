require 'time'
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
      # @vendors.find_all{|vendor| vendor.inventory.keys.include?(item)}
      # @vendors.find_all{|vendor| vendor.inventory.key?(item)}
      @vendors.select {|vendor| vendor.check_stock(item) > 0}

    end

    def total_inventory
      total_inventory_items = Hash.new
      @vendors.each { |vendor|

        vendor.inventory.each { |item, quantity|
          if total_inventory_items.keys.include?(item)
            total_inventory_items[item][:quantity] += quantity
            total_inventory_items[item][:vendors] << vendor
          else
            total_inventory_items[item] = Hash.new
            total_inventory_items[item][:quantity] = quantity
            total_inventory_items[item][:vendors] = []
            total_inventory_items[item][:vendors] << vendor
          end
                              }
                    }
      total_inventory_items
    end

    def overstocked_items
      overstock = total_inventory.find_all {|item, hash|
            hash[:quantity] > 50 && hash[:vendors].length >1
          }
      overstock.map { |overstock|  overstock[0]}
    end

    def sorted_item_list
      total_inventory.map {|overstock| overstock[0].name}.sort
    end

    def date
      [Date.today.strftime('%d/%m/%y')[0..-3], Date.today.year.to_s].join
    end

    def sell(item, quantity)
      item_found = total_inventory.find { |i, hash| i = item}
          if item_found != nil && total_inventory[item][:quantity] >= quantity
                  @vendors.each {|vendor|
                    if  vendor.inventory[item] > quantity
                           vendor.inventory[item] -= quantity
                           quantity = 0
                     else
                           quantity -= vendor.inventory[item]
                           vendor.inventory[item] = 0
                     end
                     break if quantity == 0
                                      }
                    true
          else
                    false
          end

    end
end

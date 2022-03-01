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
      @vendors.find_all{|vendor| vendor.inventory.keys.include?(item)}
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
      Date.today.strftime('%d/%m/%y')
    end

    def sell(item, quantity)
      total_inventory.find {|i, hash|
        if i == item && hash[:quantity] >= quantity
          return true
        else
          return false
        end
                            }
    end
end

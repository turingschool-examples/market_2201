require "./item"
class Vendor
  attr_reader :name, :inventory, :price, :count
  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def stock(item, count)
    @item = Item.new({item: item, item_name: item_name, item_price: price, count: count})
  end


  # def check_stock(item)
  #   @inventory.each {|item| item.count}
  # end
end

class Vendor
  attr_reader :name,
              :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    @inventory.find_all { |stock| stock.item == item }.count
  end

  def stock(item, amount)
    @inventory = item, amount
  end
end

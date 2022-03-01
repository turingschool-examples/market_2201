class Vendor
  attr_reader :name, :inventory
  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    stock = @inventory.map { |item| item.value }
    stock.count
  end


end

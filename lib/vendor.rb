class Vendor

  attr_reader :name, :inventory, :check_stock

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
    @check_stock = 0
  end


  def check_stock(item)
    @check_stock
  end

  def stock(item, inventory)
    
  end
end

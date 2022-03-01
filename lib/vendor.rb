class Vendor
  attr_reader :name,
              :inventory
  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    if @inventory[:item] == nil
      0
    else
      @inventory[:item]
    end
  end
end

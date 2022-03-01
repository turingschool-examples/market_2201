class Item
  attr_reader :name
  def initialize (info_hash)
    @name = info_hash[:name]
    @price = info_hash[:price]
  end

  def price
    sliced = @price.slice(1,@price.length-1)
    sliced.to_f
  end

end

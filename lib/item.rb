class Item
  attr_reader :info, :name, :price

  def initialize(info)
    @info = info
    @name = info[:name]
    @price = info[:price].delete("$").to_f
  end


end

class Item
  attr_reader :name,
              :price,
              :info

  def initialize(info)
    @info = info
    @name = info[:name]
    @price = info[:price]
  end

end

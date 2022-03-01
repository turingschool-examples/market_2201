class Item
  attr_reader :name, :price
  def initialize(details)
    @details = details
    @name = details[:name]
    @price = details[:price][1..-1].to_f
  end

end

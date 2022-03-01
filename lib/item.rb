class Item
  attr_reader :name, :price
 def initialize(info)
   @name = info[:name]
   @price = info[:price][1..-1].to_f
 end

end

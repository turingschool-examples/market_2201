require './lib/vendor'
require './lib/item'

class Market
attr_reader

def initialize(name)
  @name = name
  @vendors = []
end

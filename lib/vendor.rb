require_relative 'item'

class Vendor
  attr_reader :inventory, :name
  def initialize(name)
    @name = name
    @inventory = {}
  end
end

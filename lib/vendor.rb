require 'pry'
require './item'

class Vendor
  attr_reader :name, :inventory

  def initialize(name, inventory = {})
    @name = name
    @inventory = inventory
  end
end

require 'pry'
require './item'

class Vendor
  attr_reader :name
  
  def initialize(name)
    @name = name
  end
end

class Market
  attr_reader :name,
              :vendors

  def initialize(name)
    @name = name
    @vendors = Array.new
  end

  def add_vendor(new_vendor)
    @vendors << new_vendor
  end

  def vendor_names
    names = @vendors.map { |vendor| vendor.name }
    names
  end

end

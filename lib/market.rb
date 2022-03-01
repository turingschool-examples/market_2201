class Market
  attr_reader :name, :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    if !vendors.include?(vendor)
      vendors << vendor
    end
  end

  def vendor_names
    names = []
    vendors.each do |vendor|
      names << vendor.name
    end
    return names
  end
end
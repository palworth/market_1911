class Market
  attr_reader :name, :vendors
  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor_obj)
    @vendors << vendor_obj
  end

  def vendor_names
    @vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(item)
    @vendors.find_all do |vendor|
      vendor.inventory[item] != 0
    end
  end

  def sorted_item_list
    x = []
    @vendors.each do |vendor|
      vendor.inventory.each do |k, v|
      x << k.name
      end
    end
    x.sort_by {|name| name}.uniq
  end

  def total_inventory
    inventory_log = Hash.new(0)
    @vendors.each do |vendor|
      vendor.inventory.map do |keys, values|
        inventory_log[keys] += values
        # require "pry"; binding.pry
      end
    end
    inventory_log
  end
end

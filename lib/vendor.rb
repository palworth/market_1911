class Vendor
  attr_reader :name, :inventory
  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(ingredient_object)
    @inventory[ingredient_object]
  end

  def stock(ingredient_obj, amount)
      @inventory[ingredient_obj] += amount
      @inventory
  end
end

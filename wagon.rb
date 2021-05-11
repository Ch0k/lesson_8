class Wagon
  include Company

  def initialize(quantity)
    @place = 0
    @quantity = quantity.to_i
  end
end

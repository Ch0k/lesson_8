class CargoWagon < Wagon
  attr_reader :type
  attr_accessor :quantity, :place

  def initialize(quantity)
    super
    @type = 'cargo'
  end

  def free_place
    @quantity - @place
  end
end

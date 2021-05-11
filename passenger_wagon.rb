class PassengerWagon < Wagon
  attr_reader :type, :place
  attr_accessor :quantity

  def initialize(quantity)
    super
    @type = 'passenger'
  end

  def place=(value)
    @place += value
  end

  def free_place
    @quantity - @place
  end
end

# frozen_string_literal: true

# Class for create cargotrain
class CargoTrain < Train
  include InstanceCounter
  def initialize(number)
    super
    @type = 'cargo'
  end
end

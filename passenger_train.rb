# frozen_string_literal: true

# Class for create passenger train
class PassengerTrain < Train
  include InstanceCounter
  def initialize(number)
    super
    @type = 'passenger'
  end
end

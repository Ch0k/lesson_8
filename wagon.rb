# frozen_string_literal: true

# Class for create wagon
class Wagon
  include Company

  def initialize(quantity)
    @place = 0
    @quantity = quantity.to_i
  end
end

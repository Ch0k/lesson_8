# frozen_string_literal: true

# Module for count
module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  # Module for count
  module ClassMethods
    def instances
      @instances ||= 0
    end

    attr_writer :instances
  end

  # Module for count
  module InstanceMethods
    def register_instance
      self.class.instances += 1
    end
  end
end

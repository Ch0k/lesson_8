# frozen_string_literal: true

# Class for create station object
class Station
  include InstanceCounter

  NAME_FORMAT = /.+/.freeze

  attr_reader :name, :trains

  # rubocop:disable Style/ClassVars
  @@all = []
  def initialize(name)
    @name = name
    @trains = []
    validate!
    @@all << self
  end
  # rubocop:enable Style/ClassVars

  def valid?
    validate!
    true
  rescue StandardError
    false
  end

  def each_train(&block)
    @trains.each(&block)
  end

  def reception(train)
    @trains << train
  end

  def train_list_type(type)
    @trains.filter { |train| train.type == type }
  end

  def send_train(train)
    @trains.delete(train)
  end

  def self.print_all
    @@all.each_with_index { |station, index| puts "#{index}: Станция #{station.name}" }
  end

  private

  def validate!
    raise "Name can't be nil" if name.nil?
    raise 'Name has invalid format' if name !~ NAME_FORMAT
  end
end

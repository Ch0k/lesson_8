# frozen_string_literal: true

# Class for create train object
class Train
  include Company
  include InstanceCounter

  attr_accessor :speed
  attr_reader :number, :type

  NUMBER_FORMAT = /^[\d\w]{3}-?[\d\w]{2}$/.freeze
  # rubocop:disable Style/ClassVars

  @@all = []
  def initialize(number)
    @number = number
    @wagons = []
    validate!
    register_instance
    @@all << self
  end
  # rubocop:enable Style/ClassVars

  def each_wagon(&block)
    @wagons.each(&block)
  end

  def self.find(number)
    @@all.select { |a| a.number == number }
  end

  def valid?
    validate!
    true
  rescue StandardError
    false
  end

  def add_wagon(wagon)
    @wagons << wagon if wagon.type == type
  end

  def wagon_quantity
    @wagons.length
  end

  def self.all
    @@all.each_with_index { |train, index| puts "#{index}: Поезд номер № #{train.number}" }
  end

  def stop
    @speed = 0
  end

  def show_trains
    @numbers.each { |station| puts station }
  end

  def route(route)
    @index = 0
    @train_route = route.show_stations
    station.reception(self)
  end

  def move_station_up
    station.send_train(self)
    @index += 1
    station.reception(self)
  end

  def move_station_down
    station.send_train(self)
    @index -= 1
    station.reception(self)
  end

  def next_station
    if @index + 1 == @train_route.length
      puts 'End'
    else
      @next_train_station = @train_route[@index + 1]
    end
  end

  def station
    @train_route[@index]
  end

  def last_station
    if @index.zero?
      puts 'Конечной станции нет'
    else
      @last_train_station = @train_route[@index - 1]
    end
  end

  private

  def validate!
    raise "Number can't be nil" if number.nil?
    raise 'Number should be at least 6 symbols' if number.length < 5
    raise 'Number has invalid format' if number !~ NUMBER_FORMAT
  end
end

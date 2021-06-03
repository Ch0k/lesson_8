# frozen_string_literal: true

# Class for create route objects
class Route
  include InstanceCounter

  # rubocop:disable Style/ClassVars
  @@all = []
  def initialize(first_station, last_station)
    @first_station = first_station
    @last_station = last_station
    @stations = [first_station, last_station]
    @@all << self
  end
  # rubocop:enable Style/ClassVars

  def self.all
    @@all
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def del_station(station)
    @stations.delete(station)
  end

  def show_stations
    @stations.each { |station| puts station.name }
  end

  def show_first_station
    @first_station
  end
end

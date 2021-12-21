# frozen_string_literal: true

require_relative 'instance_counter'

class Route
  include InstanceCounter
  attr_reader :name, :stations

  def initialize(first_station, last_station)
    @stations = [first_station, last_station]
    @name = "#{first_station.name} - #{last_station.name}"
    register_instance
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def delete_station(station)
    @stations.delete(station)
  end

  private

  def print_station
    @stations.each { |station| puts station.name }
  end
end

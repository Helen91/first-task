# frozen_string_literal: true

require_relative 'company'
require_relative 'instance_counter'

class Train
  include Company
  include InstanceCounter
  attr_reader :wagons, :route, :number, :type
  attr_accessor :current_station

  NUMBER_REGEX = /^[а-яa-z0-9]{3}-?[а-яa-z0-9]{2}$/i.freeze
  TYPE_REGEX = /[пассажирский][товарный]/i.freeze

  @@trains = []

  class << self
    def find(number)
      @@trains.find { |t| t.number == number }
    end
  end

  def initialize(number, type)
    @number = number
    @type = type
    @wagons = []
    @@trains << self
    validate!
    register_instance
  end

  def valid?
    validate!
    true
  rescue StandardError
    false
  end

  def wagons_size
    wagons.size
  end

  def each_wagon(&block)
    wagons.each(&block) if block_given?
  end

  def hook_wagon(wagon)
    wagons.push(wagon) if wagon.type == type
  end

  def unhook_wagon(wagon)
    wagons.delete(wagon)
  end

  def route=(route)
    @route = route
    self.current_station = route.stations.first
    current_station.add_train(self)
  end

  def move_front
    current_station.send_train(self)
    self.current_station = next_station if next_station
    current_station.add_train(self)
  end

  def move_back
    current_station.send_train(self)
    self.current_station = previous_station if previous_station
    current_station.add_train(self)
  end

  private

  def next_station
    route.stations[route.stations.index(current_station) + 1] if current_station != route.stations[-1]
  end

  def previous_station
    route.stations[route.stations.index(current_station) - 1] if current_station != route.stations[0]
  end

  def validate!
    raise 'Неправильный тип поезда!' if type !~ TYPE_REGEX
    raise 'Неправильный номер поезда!' if number !~ NUMBER_REGEX
  end
end

class Train
  include Company
  include InstanceCounter
  attr_reader :wagons, :route, :number, :type
  attr_accessor :current_station

  TRAIN_NUMBER = /^[а-яa-z0-9]{3}?-?[а-яa-z0-9]{2}$/i
  TRAIN_TYPE = /[cargo][passenger]/i

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
  rescue
    false
  end

  def hook_wagon(wagon)
    if wagon.type == type
      wagons.push(wagon)
    end
  end

  def unhook_wagon(wagon)
    wagons.delete(wagon)
  end

  def route=(route)
    @route = route
    self.current_station = route.stations.first
  end

  def move_front
    self.current_station = next_station if next_station
  end

  def move_back
    self.current_station = previous_station if previous_station
  end

  private

  def next_station
    if current_station != route.stations[-1]
      route.stations[route.stations.index(current_station) + 1]
    end
  end

  def previous_station
    if current_station != route.stations[0]
      route.stations[route.stations.index(current_station) - 1]
    end
  end

  def validate!
    raise "Incorrect train type!" if type !~ TRAIN_TYPE
    raise "Incorrect train number!" if number !~ TRAIN_NUMBER
  end
end

class Train
  attr_reader :wagons, :route, :number, :current_station, :type

  def initialize(number, type)
    @number = number
    @type = type
    @wagons = []
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
    @current_station = route.stations.first
  end

  def move_front
    current_station = next_station if next_station
  end

  def move_back
    current_station = previous_station if previous_station
  end

  private
  # не используеться в других классах

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
end

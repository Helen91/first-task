class Train
  def initialize(number, type)
    @number = number
    @type = type
    @wagons = []
  end
  
  def type
    @type
  end

  def add_wagon(wagon)
    if wagon.type == type
      @wagons.push(wagon)
    end
  end

  def unhook_wagon
    @wagons.pop
  end

  def route=(route)
    @route = route
    @curent_station = route.stations.first
  end

  def move_front
    @curent_station = next_station if next_station
  end

  def move_back
    @curent_station = previous_station if previous_station
  end

  def next_station
    if @curent_station != route.stations[-1]
      route.stations[stations.index(@curent_station) + 1]
    end
  end

  def previous_station
    if @curent_station != route.stations[0]
      route.stations[stations.index(@curent_station) - 1]
    end
  end
end

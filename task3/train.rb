class Station
  # возвращает список поездов  которые на станции
  def initialize(title)
    @title = title
    @trains = []
  end

  def add(train)
    @trains << train
  end

  def trains_list(type)
    # возращает список всех поездов по типу
    @trains.select { |train| train.type == type }
  end

  def send_train(train)
    @trains.delete(train)
  end
end

class Route
  attr_reader :stations

  def initialize(first_station, last_station)
    @stations = [first_station, last_station]
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def delete_station(station)
    @stations.delete(station)
  end

  def print_station
    puts @stations
  end
end

class Train
  attr_accessor :type, :speed

  def initialize(number, type, wagons)
    @number = number
    @type = type
    @count_wagons = count_wagons
    @speed = 0
    @curent_station = nil
  end

  def stop
    @speed = 0
  end

  def add_wagons
    if speed.zero?
      @wagons += 1
    elsif speed != 0
      puts "stop train"
    end
  end

  def delete_wagons
    if speed.zero?
      @wagons -= 1
    elsif wagons != 0
      puts "stop wagons"
    end
  end

  def route=(route)
    @route = route
    @curent_station = route.stations.first
  end

  def move_front
    @curent_station = next_station
  end

  def move_back
    @curent_station = previous_station
  end

  def curent_station
    @curent_station
  end

  def next_station
    if @curent_station == route.stations[-1]
      puts "last station"
      @curent_station
    else
      route.stations[stations.index(@curent_station) + 1]
    end
  end

  def previous_station
    if @curent_station == route.stations[0]
      puts "first station"
      @curent_station
    else
      route.stations[stations.index(@curent_station) - 1]
    end
  end
end

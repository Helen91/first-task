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
  attr_reader :type

  def initialize(type)
    @type = type
  end
end

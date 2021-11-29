class Route
  def initialize(first_station, last_station)
    @stations = [first_station, last_station]
    @first_station = first_station
    @last_station = last_station
  end

  def name
    "#{@first_station.name} - #{@last_station.name}"
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def delete_station(station)
    @stations.delete(station)
  end

  def print_station
   @stations.each { |station| puts station.name }
  end
end

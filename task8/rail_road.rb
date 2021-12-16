class RailRoad
  def initialize
    @stations = []
    @trains = []
    @routes = []
  end

  def main_menu
    loop do
      print MAIN_MENU

      operation = gets.chomp.to_i

      case operation
      when 1 then self.create_station
      when 2 then self.create_train
      when 3 then self.change_route
      when 4 then self.follow_route
      when 5 then self.hook_wagon
      when 6 then self.unhook_wagon
      when 7 then self.move_train
      when 8 then self.show_stations_trains
      when 0 then break
      end
    end
  end

  private
  # закрытый интерфейс

  def create_station
    print "Введите название станции: "
    station_name = gets.chomp
    @stations << Station.new(station_name)
    puts "Станция #{station_name} создана!"
  rescue RuntimeError => e
    puts "#{e.message}"
  end

  def create_train
    print "Введите номер поезда: "
    number = gets.chomp

    print TRAIN_TYPE_CHOICE
    chosen_type = gets.chomp.to_i

    if chosen_type == 1
      train = PassengerTrain.new(number)
    elsif chosen_type == 2
      train = CargoTrain.new(number)
    end
    @trains << train

    puts "#{train.type} поезд номер #{train.number} создан!"

  rescue RuntimeError => e
    puts "#{e.message}"
  end

  def create_route
    puts "Выберите первую станцию маршрута: "
    first_station = self.choose_station
    puts "Выберите конечную станцию маршрута: "
    last_station = self.choose_station

    route = Route.new(first_station, last_station)
    @routes << route

    puts "Маршрут #{route.name} создан!"
  end

  def add_station
    route = self.choose_route
    station = self.choose_station
    route.add_station(station)
    puts "Станция #{station.name} добавлена в маршрут!"
  rescue RuntimeError => e
    puts "#{e.message}"
  end

  def delete_station
    route = self.choose_route
    station = self.choose_station
    route.delete_station(station)
    puts "Станция #{station.name} удалена из маршрута!"
  end

  def change_route
    loop do
      print ROUTE_MENU

      route_operation = gets.chomp.to_i

      case route_operation
      when 1 then self.create_route
      when 2 then self.add_station
      when 3 then self.delete_station
      when 0 then break
      end
    end
  end

  def follow_route
    train = choose_train
    route = choose_route
    train.route = route

    puts "#{train.type} поезд номер #{train.number} следует по маршруту #{route.name}!"
  end

  def hook_wagon
    train = choose_train
    print "Введите номер вагона: "
    wagon_number = gets.chomp
  

    if train.type == "Пассажирский"
      print "Ведите количесво мест: "
      places = gets.chomp
      wagon = PassengerWagon.new(wagon_number, places)
      train.hook_wagon(wagon)
    elsif train.type == "Товарный"
      print "Ведите объем вагона: "
      volume = gets.chomp
      wagon = CargoWagon.new(wagon_number, volume)
      train.hook_wagon(wagon)
    end

    puts "Вагон номер #{wagon.number} добавлен."
  rescue RuntimeError => e
    puts "#{e.message}"
  end

  def unhook_wagon
    train = choose_train
    wagon = choose_wagon(train)
    train.unhook_wagon(wagon)

    puts "Вагон номер #{wagon.number} удален."
  end

  def move_train
    train = choose_train
    if train.current_station
      puts MOVING_TRAIN
      direction = gets.chomp.to_i

      if direction == 1
        train.move_front
      elsif direction == 2
        train.move_back
      end
      print "Поезд прибыл на станцию #{train.current_station.name}"
    else
      puts "Поезду не назначен маршрут("
    end
  end

  def show_stations_trains
    puts "Станции:"
    @stations.each  do |station|
      puts "#{station.name}"
      station.each_train do |train|
        puts "#{train.type}, #{train.number}, #{train.wagons_size}"
        train.each_wagon do |wagon|
          puts "#{wagon.number}, #{wagon.free_places}, #{wagon.type}"
        end
      end
    end
  end

  def choose_route
    puts "Выберите маршрут:"
    @routes.each_index { |index| puts "#{index + 1} - #{@routes[index].name}" }
    @routes[gets.chomp.to_i - 1]
  end

  def choose_train
    puts "Выберите поезд:"
    @trains.each_index { |index| puts "#{index + 1} - #{@trains[index].type} поезд номер #{@trains[index].number}" }
    @trains[gets.chomp.to_i - 1]
  end

  def choose_wagon(train)
    puts "Выберите вагон:"
    train.wagons.each_index { |index| puts "#{index + 1} - #{train.wagons[index].number}"}
    train.wagons[gets.chomp.to_i - 1]
  end

  def choose_station
    @stations.each_index { |index| puts "#{index + 1} - #{@stations[index].name}"}
    @stations[gets.chomp.to_i - 1]
  end
end
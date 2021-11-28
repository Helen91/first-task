require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'wagon'
require_relative 'cargo_wagon'
require_relative 'passenger_wagon'

cargo = CargoTrain.new(2)
passeger = PassengerTrain.new(1)

cargo_wagon = CargoWagon.new
passenger_wagon = PassengerWagon.new

result = cargo.add_wagon(passenger_wagon)
result = cargo.add_wagon(cargo_wagon)
result = passeger.add_wagon(passenger_wagon)
result = passeger.add_wagon(cargo_wagon)

cargo_wagons = cargo.instance_variable_get("@wagons")
passenger_wagons = passeger.instance_variable_get("@wagons")
puts cargo_wagons.size == 1 && passenger_wagons.size == 1

require_relative "wagon"

class PassengerWagon < Wagon
  def initialize(number)
    super("Пассажирский", number)
  end
end

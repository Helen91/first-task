require_relative "wagon"

class PassengerWagon < Wagon
  def initialize(number, places)
    super("Пассажирский", number, places.to_i)
  end

  def take_place
    if @occupied_places < places
      @occupied_places += 1
    end
  end
end

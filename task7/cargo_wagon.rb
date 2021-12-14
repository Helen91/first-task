require_relative "wagon"

class CargoWagon < Wagon
  def initialize(number)
    super("Товарный", number)
  end
end

require_relative "wagon"

class CargoWagon < Wagon
  def initialize(number, volume)
    super("Товарный", number, volume.to_f)
  end

  def up_volume(volume)
    if @occupied_places + volume < places
      @occupied_places += volume
    end
  end
end

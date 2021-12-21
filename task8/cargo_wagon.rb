# frozen_string_literal: true

require_relative 'wagon'

class CargoWagon < Wagon
  def initialize(number, volume)
    super('Товарный', number, volume.to_f)
  end

  def up_volume(volume)
    @occupied_places += volume if @occupied_places + volume < places
  end
end

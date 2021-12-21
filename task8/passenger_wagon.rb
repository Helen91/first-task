# frozen_string_literal: true

require_relative 'wagon'

class PassengerWagon < Wagon
  def initialize(number, places)
    super('Пассажирский', number, places.to_i)
  end

  def take_place
    @occupied_places += 1 if @occupied_places < places
  end
end

require_relative "company"

class Wagon
  include Company

  TYPE_REGEX = /[товарный][пассажирский]/i
  NUMBER_REGEX = /^[а-яa-z0-9]{3}-?[а-яa-z0-9]{2}$/i

  attr_reader :type, :number, :places

  def initialize(type, number, places)
    @type = type
    @number = number
    @places = places
    @occupied_places = 0
    validate!
  end

  def valid?
    validate!
    true
  rescue
    false
  end

  def all_occupied
    @occupied_places
  end

  def free_places
    @free_places = @places - @occupied_places
    @free_places
  end

  private

  def validate!
    raise "Неправильный тип вагона!" if type !~ TYPE_REGEX
    raise "Неправильный номер вагона!" if number !~ NUMBER_REGEX
  end
end

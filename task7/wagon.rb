require_relative "company"

class Wagon
  include Company

  TYPE_REGEX = /[товарный][пассажирский]/i
  NUMBER_REGEX = /^[а-яa-z0-9]{3}-?[а-яa-z0-9]{2}$/i

  attr_reader :type, :number

  def initialize(type, number)
    @type = type
    @number = number
    validate!
  end

  def valid?
    validate!
    true
  rescue
    false
  end

  private

  def validate!
    raise "Неправильный тип вагона!" if type !~ TYPE_REGEX
    raise "Неправильный номер вагона!" if number !~ NUMBER_REGEX
  end
end

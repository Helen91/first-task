# frozen_string_literal: true

require_relative 'company'
require_relative 'validation'

class Wagon
  include Company
  include Validation

  validate :type, :format, /[товарный][пассажирский]/i
  validate :number, :format, /^[а-яa-z0-9]{3}-?[а-яa-z0-9]{2}$/i

  attr_reader :type, :number, :places

  def initialize(type, number, places)
    @type = type
    @number = number
    @places = places
    @occupied_places = 0
    validate!
  end

  def all_occupied
    @occupied_places
  end

  def free_places
    @free_places = @places - @occupied_places
    @free_places
  end
end

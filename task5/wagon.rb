class Wagon
  include Company
  attr_reader :type, :number

  def initialize(type, number)
    @type = type
    @number = number
  end
end

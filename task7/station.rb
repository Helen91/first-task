require_relative "instance_counter"

class Station

  include InstanceCounter
  attr_reader :name

  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    @trains = []
    @@all << self
    validate!
    register_instance
  end

  def add_train(train)
    @trains << train
  end

  private

  def trains_list(type)
    @trains.select { |train| train.type == type }
  end

  def send_train(train)
    @trains.delete(train)
  end

  def validate!
    raise "Неправильное название станции!" if name.nil? || name.empty? 
  end
end
# frozen_string_literal: true

require_relative 'instance_counter'
require_relative 'validation'

class Station
  include InstanceCounter
  include Validation

  attr_reader :name

  validate :name, :presence

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

  def each_train(&block)
    @trains.each(&block) if block_given?
  end

  def add_train(train)
    @trains << train
  end

  def send_train(train)
    @trains.delete(train)
  end

  private

  def trains_list(type)
    @trains.select { |train| train.type == type }
  end
end

class Station
  def initialize(name)
    @name = name
    @trains = []
  end

  def name
    @name
  end

  def add_train(train)
    @trains << train
  end

  def trains_list(type)
    @trains.select { |train| train.type == type }
  end

  def send_train(train)
    @trains.delete(train)
  end
end

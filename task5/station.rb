class Station
  def initialize(title)
    @title = title
    @trains = []
  end

  def add(train)
    @trains << train
  end

  def trains_list(type)
    @trains.select { |train| train.type == type }
  end

  def send_train(train)
    @trains.delete(train)
  end
end

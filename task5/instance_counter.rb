module InstanceCounter
  class << self
    def included(base)
      base.extend ClassMethods
      base.include InstanceMethods
    end
  end

  module ClassMethods
    attr_writer :instances

    def instances
      @instances || 0
    end
  end

  module InstanceMethods
    private

    def register_instance
      self.class.instances += 1
    end
  end
end

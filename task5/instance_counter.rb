module InstanceCounter
  class << self
    def included(base)
      base.extend ClassMethods
      base.include InstanceMethods
    end
  end

  module ClassMethods
  attr_accessor :count

    def instances
    puts count
    end
  end

  module InstanceMethods
    private

    def register_instance
      self.class.count ||= 0
      self.class.count += 1
    end
  end
end

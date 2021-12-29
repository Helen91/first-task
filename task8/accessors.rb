# frozen_string_literal: true

module Accessors
  def attr_accessor_with_history(*method_names)
    method_names.each do |method_name|
      define_method(method_name) do
        instance_variable_get("@#{method_name}")
      end
      define_method("#{method_name}=") do |value|
        instance_variable_set("@#{method_name}", value)
        history = instance_variable_get("@#{method_name}_history")
        history ||= []
        history << value
        instance_variable_set("@#{method_name}_history", history)
      end
      define_method("#{method_name}_history") do
        instance_variable_get("@#{method_name}_history")
      end
    end
  end

  def strong_attr_accessor(method_name, klass)
    define_method(method_name) do
      instance_variable_get("@#{method_name}")
    end
    define_method("#{method_name}=") do |value|
      raise unless value.is_a?(klass)
      instance_variable_set("@#{method_name}", value)
    end
  end
end

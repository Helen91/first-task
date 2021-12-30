# frozen_string_literal: true

module Validation
  class << self
    def included(base)
      base.extend ClassMethods
      base.include InstanceMethods
    end
  end

  module ClassMethods
    attr_reader :validations

    def validate(attr_name, type, option = nil)
      @validations ||= []
      @validations << { attr: attr_name, type: type, option: option }
    end
  end

  module InstanceMethods
    def valid?
      validate!
      true
    rescue RuntimeError
      false
    end

    def validate!
      self.class.validations.each do |validation|
        value = instance_variable_get("@#{validation[:attr]}")
        send(validation[:type], value, validation[:option])
      end
    end

    def presence(value, _option)
      raise "Не может быть пустым" if value.nil? || value.to_s.empty?
    end

    def format(value, format)
      raise "Ошибка формата" if value !~ format
    end

    def type(value, klass)
      raise "Неправильный класс" unless value.is_a?(klass)
    end
  end
end

module Mongoid
  module MultiParameterAttributes
  protected
    def instantiate_object(klass, values_with_empty_parameters)
      return nil if values_with_empty_parameters.all? { |v| v.nil? }
      values = values_with_empty_parameters.collect { |v| v.nil? ? 1 : v }
      if klass == DateTime || klass == Time
        return nil if values.size < 4
        return nil if values.first < 1900
        klass.send(:convert_to_time, values)
      elsif klass == Date
        return nil if values.size < 3
        return nil if values.first < 1900
        klass.send(:convert_to_time, values)
      elsif klass
        klass.new *values
      else
        values
      end
    end
  end
end
class << Integer
  def set(integer)
    case integer
    when nil, ""
      nil
    when String
      integer.tr("０-９", '0-9').gsub(/[^^]-/, "").gsub(/[^-0-9]/, "").to_i
    else
      integer.to_i
    end
  end
end

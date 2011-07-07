class EquipmentItem
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, :type => String
  field :content, :type => String
  field :priority, :type => Integer
  embedded_in :equipment, :inverse_of => :items

  def _delete
    @_delete
  end

  def _delete=(true_or_false)
    case true_or_false
    when 'true', '1'
      @_delete = true
    else
      @_delete = nil
    end
  end

  class << self
    def ordered_by_priority
      criteria.desc(:priority)
    end
  end
end

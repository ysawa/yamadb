class Equipment
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, :type => String
  field :content, :type => String
  field :season_end, :type => Integer
  field :season_start, :type => Integer
  embeds_many :items, :class_name => "EquipmentItem", :varidate => false
  before_save :delete_items_if_necesarry
  validates_with EquipmentValidator

  def existing_items_attributes=(items_attributes)
    items_attributes.each do |item_id, attrs|
      item = items.find(item_id)
      item.attributes = attrs
    end
  end

  def new_items_attributes=(items_attributes)
    items_attributes.each do |attrs|
      items.build(attrs)
    end
  end
private
  def delete_items_if_necesarry
    items.each do |item|
      item.delete if item._delete || item.priority.blank?
    end
  end
end

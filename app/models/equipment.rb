class Equipment
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, :type => String
  field :content, :type => String
  field :season_end, :type => Integer
  field :season_start, :type => Integer
  has_many :items, :class_name => "EquipmentItem", :varidate => false
  before_save :update_items
  before_save :destroy_items_if_necesarry
  validates_with EquipmentValidator

  def existing_items_attributes=(items_attributes)
    items_attributes.each do |item_id, attrs|
      item = self.items.select { |item| item.id.to_s == item_id.to_s }.first
      item.write_attributes(attrs)
    end
  end

  def new_items_attributes=(items_attributes)
    self.items = [] if self.items.nil?
    items_attributes.each do |attrs|
      self.items.build(attrs)
    end
  end
private
  def destroy_items_if_necesarry
    self.items.each do |item|
      item.destroy if item._destroy || item.priority.blank?
    end
    true
  end

  def update_items
    result = true
    self.items.each do |item|
      result = false unless item.save
    end
    result
  end
end

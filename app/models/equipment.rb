class Equipment
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, :type => String
  field :content, :type => String
  field :season_end, :type => Integer
  field :season_start, :type => Integer
  has_many :items, :class_name => "EquipmentItem", :varidate => false
  before_save :destroy_items_if_necesarry
  before_save :save_items
  before_destroy :destroy_all_items
  validates_with EquipmentValidator

  def existing_items_attributes=(items_attributes)
    # WARNING: should not reload equipemnt_items
    # TODO: fix it to be more useful
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
  def destroy_all_items
    self.items.destroy_all
  end

  def destroy_items_if_necesarry
    self.items.each do |item|
      item.destroy if item.persisted? && (item._destroy || item.priority.blank?)
    end
    true
  end

  def save_items
    self.items.each do |item|
      item.equipment_id = self.id
      item.save(:validate => false) if item.changed?
    end
  end
end

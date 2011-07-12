class EquipmentItem
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, :type => String
  field :content, :type => String
  field :priority, :type => Integer
  belongs_to :equipment, :inverse_of => :items
  has_and_belongs_to_many :products
  after_save :save_products

  def _destroy
    @_destroy
  end

  def _destroy=(true_or_false)
    case true_or_false
    when 'true', '1'
      @_destroy = true
    else
      @_destroy = nil
    end
  end

  def load_products
    self.products.each do |product|
      product.equipment_item_ids.delete(self.id)
      product.save
    end
    self.product_ids = []
    self.products = Product.search_from_amazon(self.name, :search_index => 'SportingGoods') if self.name.present?
  end

  class << self
    def ordered_by_priority
      criteria.desc(:priority)
    end
  end
private
  def save_products
    self.products.each do |product|
      product.save(:validate => false)
    end
  end
end

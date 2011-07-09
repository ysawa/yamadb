class Product
  include Mongoid::Document
  include Mongoid::Timestamps
  field :api, :type => Symbol
  field :asin, :type => String
  field :href, :type => String
  field :group, :type => String
  field :name, :type => String
  field :content, :type => String
  field :manufacturer, :type => String
  field :price, :type => Integer
  field :publisher, :type => String
  index :asin, :unique => true
  has_and_belongs_to_many :equipment_items
  has_many :pictures, :as => :album
  validates_with ProductValidator
  before_save :update_pictures
  before_destroy :destroy_pictures

  def Product.new_from_amazon_element(element)
    product = Product.find_or_initialize_by(:asin => element.get('ASIN'))
    product.api = :amazon
    product.href = element.get('DetailPageURL')
    product.group = encode_unicode_entities(element.get('ItemAttributes/ProductGroup'))
    product.name = encode_unicode_entities(element.get('ItemAttributes/Title'))
    product.manufacturer = encode_unicode_entities(element.get('ItemAttributes/Manufacturer'))
    product.price = element.get('ItemAttributes/ListPrice/Amount')
    product.publisher = encode_unicode_entities(element.get('ItemAttributes/Publisher'))
    product.pictures = Picture.pictures_from_amazon_xml(element.get('ImageSets'))
    product
  end

  def Product.search_from_amazon(query, options = {})
    products = []
    response = Amazon::Ecs.item_search_with_images(query, options)
    response.items.each do |item|
      products << Product.new_from_amazon_element(item)
    end
    products
  end

  def Product.encode_unicode_entities(unicode)
    unicode.gsub(/\&#x(\w+);/) { [$1.hex].pack('U') } if unicode
  end
private
  def destroy_pictures
    self.pictures.each do |picture|
      picture.destroy
    end
    true
  end

  def update_pictures
    result = true
    self.pictures.each do |picture|
      result = false unless picture.save
    end
    result
  end
end

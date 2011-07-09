module ApplicationHelper
  def encode_unicode_entities(unicode)
    Product.encode_unicode_entities(unicode)
  end
end

class Product
  include Mongoid::Document
  field :name, :type => String
  field :content, :type => String
  validates_with ProductValidator
end

class Product
  include Mongoid::Document
  field :code, :type => String
  field :name, :type => String
  field :content, :type => String
  index :code, :unique => true
  before_validation :create_code

  def to_param
    self.code
  end

  def Product.find_by_code(code)
    Product.find(:first, :conditions => { :code => code })
  end
private
  def create_code
    if self.code.blank?
      self.code = self._id
    end
  end
end

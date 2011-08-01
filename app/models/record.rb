class Record
  include Mongoid::Document
  include Mongoid::Timestamps
  field :content, :type => String
  field :finish, :type => Time
  field :keywords, :type => Array
  field :name, :type => String
  field :start, :type => Time
  belongs_to :created_by, :class_name => 'User', :inverse_of => :records_created
  before_save :update_keywords
  validates_with RecordValidator

  def update_keywords
    self.keywords = Yamadb::Igo.keywords(self.name, self.content)
  end

  class << self
    def search(keyword)
      criteria.where(:keywords.all => Yamadb::Igo.keywords(keyword))
    end
  end
end

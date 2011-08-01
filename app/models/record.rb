class Record
  include Mongoid::Document
  include Mongoid::Timestamps
  field :content, :type => String
  field :finish, :type => Time
  field :keywords, :type => Array
  field :name, :type => String
  field :start, :type => Time
  before_save :update_keywords

  def update_keywords
    self.keywords = Yamadb::Igo.keywords(self.name, self.content)
  end
end

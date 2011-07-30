class Record
  include Mongoid::Document
  field :name, :type => String
  field :content, :type => String
  field :start, :type => Time
  field :finish, :type => Time
end

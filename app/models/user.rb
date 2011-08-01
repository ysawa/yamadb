class User
  include Mongoid::Document
  include Mongoid::Timestamps
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  field :name, :type => String
  has_many :records_created, :class_name => 'Record', :inverse_of => :created_by, :foreign_key => :created_by_id
  validates_with UserValidator

  #these cannot be described in UserValidator, it may be mongoid's problem
  validates_uniqueness_of :email
  validates_uniqueness_of :name
end

class UserValidator < ActiveModel::Validator
  def validate(record)
    record.validates_presence_of :name
    record.validates_format_of :name, :with => /^(\w)*$/ # Pass if characters for words, including Japanese
  end
end

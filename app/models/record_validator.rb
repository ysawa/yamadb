class RecordValidator < ActiveModel::Validator
  def validate(record)
    %w(name content start finish).each do |attr_name|
      record.validates_presence_of attr_name
    end

    record.validates_format_of :name, :with => /^(\w)*$/ # Pass if characters for words, including Japanese
  end
end

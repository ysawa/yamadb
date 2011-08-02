class RecordValidator < ActiveModel::Validator
  def validate(record)
    %w(name content start finish).each do |attr_name|
      record.validates_presence_of attr_name
    end
    if record.start && record.finish
      record.errors.add(:finish, :invalid) if record.start > record.finish
    end
  end
end

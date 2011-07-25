class TweetValidator < ActiveModel::Validator
  def validate(record)
    %w(content tweet_id).each do |attr_name|
      record.validates_presence_of attr_name
    end
  end
end

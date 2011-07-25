class Tweet
  include Mongoid::Document
  include Mongoid::Timestamps
  field :content, :type => String
  field :from_user, :type => String
  field :from_user_id, :type => Integer
  field :locale, :type => String
  field :location, :type => Array
  field :profile_image_url, :type => String
  field :source, :type => String
  field :to_user, :type => String
  field :to_user_id, :type => Integer
  field :tweet_id, :type => Integer # unique id used for a tweet in Twitter
  index [[:location, Mongo::GEO2D]], :min => -180, :max => 180
  validates_with TweetValidator
  validates_uniqueness_of :tweet_id
end

class Tweet
  include Mongoid::Document
  include Mongoid::Timestamps
  field :content, :type => String
  field :from_user, :type => String
  field :from_user_id, :type => Integer
  field :locale, :type => String
  field :location, :type => Array
  field :keywords, :type => Array
  field :profile_image_url, :type => String
  field :source, :type => String
  field :to_user, :type => String
  field :to_user_id, :type => Integer
  field :tweet_id, :type => Integer # unique id used for a tweet in Twitter
  field :tweeted_at, :type => Time
  index [[:location, Mongo::GEO2D]], :min => -180, :max => 180
  index :tweet_id, :unique => true
  validates_with TweetValidator
  validates_uniqueness_of :tweet_id
  before_save :update_keywords

  def from_user_url
    Tweet.user_url(self.from_user) if self.from_user
  end

  def to_user_url
    Tweet.user_url(self.to_user) if self.to_user
  end

  def tweet_url
    "http://twitter.com/#{self.from_user}/status/#{self.tweet_id}"
  end

  def update_keywords
    self.keywords = Yamadb::Igo.keywords(self.content)
  end

  class << self
    # load_from takes 'db', 'hybrid', 'twitter'
    def search(keyword, load_from = 'hybrid')
      case load_from
      when 'db'
        tweets = search_from_db(keyword).desc(:tweeted_at).limit(15)
      when 'hybrid'
        tweets = search_from_db(keyword).desc(:tweeted_at).limit(15)
        tweets = search_from_twitter(keyword) if tweets.count < 15 || tweets.first.tweeted_at <= Time.now - 6.hours
      when 'twitter'
        tweets = search_from_twitter(keyword)
      else
        raise 'invalid load_from: ' + load_from
      end
      tweets
    end

    def search_from_db(keyword)
      criteria.where(:keywords.all => Yamadb::Igo.keywords(keyword))
    end

    def search_from_twitter(keyword)
      tweets = []
      Twitter::Search.new.containing(keyword).each do |tweet_hash|
        tweet = Tweet.find_or_initialize_by(:tweet_id => tweet_hash.id)
        if tweet.new?
          %w(from_user from_user_id to_user to_user_id profile_image_url source).each do |attr_name|
            tweet.write_attribute(attr_name, tweet_hash[attr_name])
          end
          tweet.tweeted_at = tweet_hash.created_at
          tweet.content = tweet_hash.text
          tweet.location = tweet_hash.geo.coordinates if tweet_hash.geo
          tweet.locale = tweet_hash.iso_language_code
          tweet.save
        end
        tweets << tweet
      end
      return tweets
    rescue
      return []
    end

    def user_url(user_name)
      "http://twitter.com/#!/#{user_name}"
    end
  end
end

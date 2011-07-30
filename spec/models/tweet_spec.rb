require 'spec_helper'

describe Tweet do
  describe 'method' do
    before do
      @tweet = Fabricate(:tweet)
    end
    it 'from_user_url should be twitter user url' do
      @tweet.from_user_url.should include 'http://twitter.com'
    end

    it 'to_user_url should be twitter user url' do
      @tweet.to_user_url.should include 'http://twitter.com'
    end

    it 'tweet_url should be twitter user url' do
      @tweet.tweet_url.should include 'http://twitter.com'
    end
  end
end

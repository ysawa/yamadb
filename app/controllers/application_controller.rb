class ApplicationController < ActionController::Base
  protect_from_forgery
protected
  def initialize_twitter_search
    @twitter_search = Twitter::Search.new
  end
end

require 'spec_helper'

describe "tweets/new.html.haml" do
  before(:each) do
    assign(:tweet, stub_model(Tweet,
      :from_user => "MyString",
      :from_user_id => 1,
      :tweet_id => 1,
      :to_user => "MyString",
      :to_user_id => 1,
      :source => "MyString",
      :locale => "MyString",
      :location => [],
      :content => "MyString",
      :profile_image_url => "MyString"
    ).as_new_record)
  end

  it "renders new tweet form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tweets_path, :method => "post" do
      assert_select "input#tweet_from_user", :name => "tweet[from_user]"
      assert_select "input#tweet_from_user_id", :name => "tweet[from_user_id]"
      assert_select "input#tweet_tweet_id", :name => "tweet[tweet_id]"
      assert_select "input#tweet_to_user", :name => "tweet[to_user]"
      assert_select "input#tweet_to_user_id", :name => "tweet[to_user_id]"
      assert_select "input#tweet_source", :name => "tweet[source]"
      assert_select "input#tweet_locale", :name => "tweet[locale]"
      assert_select "input#tweet_location", :name => "tweet[location]"
      assert_select "input#tweet_content", :name => "tweet[content]"
      assert_select "input#tweet_profile_image_url", :name => "tweet[profile_image_url]"
    end
  end
end

require 'spec_helper'

describe "tweets/index.html.haml" do
  before(:each) do
    assign(:tweets, [
      stub_model(Tweet,
        :from_user => "From User",
        :from_user_id => 1,
        :tweet_id => 1,
        :to_user => "To User",
        :to_user_id => 1,
        :source => "Source",
        :locale => "Locale",
        :location => [],
        :content => "Content",
        :profile_image_url => "Profile Image Url"
      ),
      stub_model(Tweet,
        :from_user => "From User",
        :from_user_id => 1,
        :tweet_id => 1,
        :to_user => "To User",
        :to_user_id => 1,
        :source => "Source",
        :locale => "Locale",
        :location => [],
        :content => "Content",
        :profile_image_url => "Profile Image Url"
      )
    ])
  end

  it "renders a list of tweets" do
    render
    assert_select "tr>td", :text => "From User".to_s, :count => 2
    assert_select "tr>td", :text => "To User".to_s, :count => 2
    assert_select "tr>td", :text => "Source".to_s, :count => 2
    assert_select "tr>td", :text => "Locale".to_s, :count => 2
    assert_select "tr>td", :text => "Content".to_s, :count => 2
    assert_select "tr>td", :text => "Profile Image Url".to_s, :count => 2
  end
end

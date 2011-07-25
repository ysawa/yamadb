require 'spec_helper'

describe "tweets/show.html.haml" do
  before(:each) do
    @tweet = assign(:tweet, stub_model(Tweet,
      Fabricate.build(:tweet).attributes
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should include @tweet.content
  end
end

require 'spec_helper'

describe "tweets/show.html.haml" do
  before(:each) do
    @user = stub_model(User,
      Fabricate.build(:user).attributes
    )
    @tweet = assign(:tweet, stub_model(Tweet,
      Fabricate.build(:tweet).attributes.merge(
          :created_by => @user
      )
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should include @tweet.content
    rendered.should include @user.name
  end
end

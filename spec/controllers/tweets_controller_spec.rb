require 'spec_helper'

describe TweetsController do
  def valid_attributes
    attrs = Fabricate.build(:tweet).attributes
    attrs.delete(:_id)
    attrs
  end

  describe "GET index" do
    it "assigns all tweets as @tweets" do
      tweet = Tweet.create! valid_attributes
      get :index
      assigns(:tweets).should eq([tweet])
    end
  end

  describe "GET show" do
    it "assigns the requested tweet as @tweet" do
      tweet = Tweet.create! valid_attributes
      get :show, :id => tweet.id.to_s
      assigns(:tweet).should eq(tweet)
    end
  end

  describe "GET new" do
    it "assigns a new tweet as @tweet" do
      get :new
      assigns(:tweet).should be_a_new(Tweet)
    end
  end

  describe "GET edit" do
    it "assigns the requested tweet as @tweet" do
      tweet = Tweet.create! valid_attributes
      get :edit, :id => tweet.id.to_s
      assigns(:tweet).should eq(tweet)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Tweet" do
        expect {
          post :create, :tweet => valid_attributes
        }.to change(Tweet, :count).by(1)
      end

      it "assigns a newly created tweet as @tweet" do
        post :create, :tweet => valid_attributes
        assigns(:tweet).should be_a(Tweet)
        assigns(:tweet).should be_persisted
      end

      it "redirects to the created tweet" do
        post :create, :tweet => valid_attributes
        response.should redirect_to(Tweet.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved tweet as @tweet" do
        Tweet.any_instance.stub(:save).and_return(false)
        post :create, :tweet => {}
        assigns(:tweet).should be_a_new(Tweet)
      end

      it "re-renders the 'new' template" do
        pending "VALIDATION NOT IMPLEMENTED"
        Tweet.any_instance.stub(:save).and_return(false)
        post :create, :tweet => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested tweet" do
        tweet = Tweet.create! valid_attributes
        Tweet.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => tweet.id, :tweet => {'these' => 'params'}
      end

      it "assigns the requested tweet as @tweet" do
        tweet = Tweet.create! valid_attributes
        put :update, :id => tweet.id, :tweet => valid_attributes
        assigns(:tweet).should eq(tweet)
      end

      it "redirects to the tweet" do
        tweet = Tweet.create! valid_attributes
        put :update, :id => tweet.id, :tweet => valid_attributes
        response.should redirect_to(tweet)
      end
    end

    describe "with invalid params" do
      it "assigns the tweet as @tweet" do
        tweet = Tweet.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Tweet.any_instance.stub(:save).and_return(false)
        put :update, :id => tweet.id.to_s, :tweet => {}
        assigns(:tweet).should eq(tweet)
      end

      it "re-renders the 'edit' template" do
        pending "VALIDATION NOT IMPLEMENTED"
        tweet = Tweet.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Tweet.any_instance.stub(:save).and_return(false)
        put :update, :id => tweet.id.to_s, :tweet => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested tweet" do
      tweet = Tweet.create! valid_attributes
      expect {
        delete :destroy, :id => tweet.id.to_s
      }.to change(Tweet, :count).by(-1)
    end

    it "redirects to the tweets list" do
      tweet = Tweet.create! valid_attributes
      delete :destroy, :id => tweet.id.to_s
      response.should redirect_to(tweets_url)
    end
  end

end

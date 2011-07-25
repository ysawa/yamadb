class TweetsController < ApplicationController
  respond_to :html
  before_filter :find_tweet, :only => [:destroy, :edit, :show, :update]

  # POST /tweets
  def create
    @tweet = Tweet.new(params[:tweet])
    flash[:notice] = "Tweet successfully created" if @tweet.save
    respond_with(@tweet)
  end

  # DELETE /tweets/1
  def destroy
    flash[:notice] = "Tweet successfully destroyed." if @tweet.destroy
    respond_with(@tweet, :location => tweets_url)
  end

  # GET /tweets/1/edit
  def edit
    respond_with(@tweet) do |format|
      format.html { render :edit }
    end
  end

  # GET /tweets
  def index
    respond_with(@tweets = Tweet.all)
  end

  # GET /tweets/new
  def new
    respond_with(@tweet = Tweet.new)
  end

  # GET /tweets/1
  def show
    respond_with(@tweet)
  end

  # PUT /tweets/1
  def update
    flash[:notice] = "Tweet successfully updated." if @tweet.update_attributes(params[:tweet])
    respond_with(@tweet)
  end
private
  def find_tweet
    @tweet = Tweet.find(params[:id])
  end
end

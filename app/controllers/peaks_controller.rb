class PeaksController < ApplicationController
  respond_to :html
  before_filter :initialize_twitter_search, :only => [:show]

  # POST /peaks
  def create
    @peak = Peak.new(params[:peak])
    if @peak.save
      flash[:notice] = "Peak successfully created"
      respond_with(@peak, :location => peaks_url)
    else
      respond_with(@peak)
    end
  end

  # DELETE /peaks/1
  def destroy
    @peak = Peak.find(params[:id])
    flash[:notice] = "Peak successfully destroyed." if @peak.destroy
    respond_with(@peak, :location => peaks_url)
  end

  # GET /peaks/1/edit
  def edit
    respond_with(@peak = Peak.find(params[:id])) do |format|
      format.html { render :action => :edit }
    end
  end

  # GET /peaks
  def index
    respond_with(@peaks = Peak.all)
  end

  # GET /peaks/new
  def new
    @peak = Peak.new
    @peak.get_location(params[:peak][:name]) if params[:peak] && params[:peak][:name]
    respond_with(@peak)
  end

  # GET /peaks/1
  def show
    @peak = Peak.find(params[:id])
    @twitter_search.containing(@peak.name)
    respond_with(@peak)
  end

  # PUT /peaks/1
  def update
    @peak = Peak.find(params[:id])
    flash[:notice] = "Peak successfully updated." if @peak.update_attributes(params[:peak])
    respond_with(@peak, :location => peaks_path)
  end
end

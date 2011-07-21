class PeaksController < ApplicationController
  respond_to :html
  before_filter :authenticate_user!, :only =>[:create, :destroy, :edit, :new, :update]
  before_filter :initialize_twitter_search, :only => [:show]
  before_filter :find_peak, :only => [:destroy, :edit, :show, :update]

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
    flash[:notice] = "Peak successfully destroyed." if @peak.destroy
    respond_with(@peak, :location => peaks_url)
  end

  # GET /peaks/1/edit
  def edit
    @peak.get_location(params[:peak][:name]) if params[:peak] && params[:peak][:name]
    respond_with(@peak) do |format|
      format.html { render :edit }
    end
  end

  # GET /peaks
  def index
    if params[:query]
      @peaks = Peak.where(:keywords.all => Yamadb::Igo.keywords(params[:query]))
    else
      @peaks = Peak.all
    end
    @peaks = @peaks.page(params[:page]).per(5)
    respond_with(@peaks)
  end

  # GET /peaks/new
  def new
    @peak = Peak.new
    @peak.get_location(params[:peak][:name]) if params[:peak] && params[:peak][:name]
    respond_with(@peak)
  end

  # GET /peaks/1
  def show
    @twitter_search.containing(@peak.name)
    respond_with(@peak)
  end

  # PUT /peaks/1
  def update
    flash[:notice] = "Peak successfully updated." if @peak.update_attributes(params[:peak])
    respond_with(@peak, :location => peaks_path)
  end
private
  def find_peak
    @peak = Peak.find(params[:id])
  end
end

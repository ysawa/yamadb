class PeaksController < ApplicationController
  respond_to :html, :json
  before_filter :authenticate_user!, :only =>[:create, :destroy, :edit, :new, :update]
  before_filter :find_peak, :only => [:destroy, :edit, :show, :update]

  # POST /peaks
  def create
    @peak = Peak.new(params[:peak])
    if @peak.save
      flash[:notice] = translate_notice('Model successfully created', :model => Peak.model_name.human)
      respond_with(@peak, :location => peaks_url)
    else
      respond_with(@peak)
    end
  end

  # DELETE /peaks/1
  def destroy
    if @peak.destroy
      flash[:notice] = translate_notice('Model successfully deleted', :model => Peak.model_name.human)
    end
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
      @peaks = Peak.search(params[:query])
    elsif params[:name]
      @peaks = Peak.where(:name => Regexp.new(params[:name]))
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
    respond_with(@peak)
  end

  # PUT /peaks/1
  def update
    if @peak.update_attributes(params[:peak])
      flash[:notice] = translate_notice('Model successfully updated', :model => Peak.model_name.human)
    end
    respond_with(@peak, :location => peaks_path)
  end
private
  def find_peak
    @peak = Peak.find(params[:id])
  end
end

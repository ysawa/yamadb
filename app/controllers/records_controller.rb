class RecordsController < ApplicationController
  respond_to :html
  before_filter :authenticate_user!, :only =>[:create, :destroy, :edit, :new, :update]
  before_filter :find_record, :only => [:destroy, :edit, :show, :update]

  # POST /records
  def create
    @record = Record.new(params[:record])
    @record.created_by = current_user
    if @record.save
      relate_to_peaks
      flash[:notice] = translate_notice('Model successfully created', :model => Record.model_name.human)
    end
    respond_with(@record)
  end

  # DELETE /records/1
  def destroy
    if @record.delete
      flash[:notice] = translate_notice('Model successfully deleted', :model => Record.model_name.human)
    end
    respond_with(@record, :location => records_url)
  end

  # GET /records/1/edit
  def edit
    respond_with(@record) do |format|
      format.html { render :edit }
    end
  end

  # GET /records
  def index
    respond_with(@records = Record.all)
  end

  # GET /records/new
  def new
    @record = Record.new
    @record.attributes = params[:record]
    respond_with(@record)
  end

  # GET /records/1
  def show
    respond_with(@record)
  end

  # PUT /records/1
  def update
    if @record.update_attributes(params[:record])
      relate_to_peaks
      flash[:notice] = translate_notice('Model successfully updated', :model => Record.model_name.human)
    end
    respond_with(@record)
  end
private
  def find_record
    @record = Record.find(params[:id])
  end

  def relate_to_peaks
    @record.peaks.each do |peak|
      peak.record_ids ||= []
      peak.record_ids << @record.id
      peak.record_ids.uniq!
      peak.save
    end
  end
end

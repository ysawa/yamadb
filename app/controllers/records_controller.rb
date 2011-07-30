class RecordsController < ApplicationController
  respond_to :html
  before_filter :authenticate_user!, :only =>[:create, :destroy, :edit, :new, :update]
  before_filter :find_record, :only => [:destroy, :edit, :show, :update]

  # POST /records
  def create
    @record = Record.new(params[:record])
    flash[:notice] = "Record successfully created" if @record.save
    respond_with(@record)
  end

  # DELETE /records/1
  def destroy
    flash[:notice] = "Record successfully destroyed." if @record.destroy
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
    respond_with(@record = Record.new)
  end

  # GET /records/1
  def show
    respond_with(@record)
  end

  # PUT /records/1
  def update
    flash[:notice] = "Record successfully updated." if @record.update_attributes(params[:record])
    respond_with(@record)
  end
private
  def find_record
    @record = Record.find(params[:id])
  end
end

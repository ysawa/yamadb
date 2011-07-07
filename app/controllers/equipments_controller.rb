class EquipmentsController < ApplicationController
  respond_to :html

  # POST /equipments
  def create
    @equipment = Equipment.new(params[:equipment])
    if @equipment.save
      flash[:notice] = "Equipment successfully created"
      respond_with(@equipment, :location => equipments_url)
    else
      respond_with(@equipment)
    end
  end

  # DELETE /equipments/1
  def destroy
    @equipment = Equipment.find(params[:id])
    flash[:notice] = "Equipment successfully destroyed." if @equipment.destroy
    respond_with(@equipment, :location => equipments_url)
  end

  # GET /equipments/1/edit
  def edit
    respond_with(@equipment = Equipment.find(params[:id])) do |format|
      format.html { render :action => :edit }
    end
  end

  # GET /equipments
  def index
    respond_with(@equipments = Equipment.all)
  end

  # GET /equipments/new
  def new
    respond_with(@equipment = Equipment.new)
  end

  # GET /equipments/1
  def show
    respond_with(@equipment = Equipment.find(params[:id]))
  end

  # PUT /equipments/1
  def update
    @equipment = Equipment.find(params[:id])
    flash[:notice] = "Equipment successfully updated." if @equipment.update_attributes(params[:equipment])
    respond_with(@equipment, :location => equipments_url)
  end
end

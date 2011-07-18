class EquipmentsController < ApplicationController
  respond_to :html

  # POST /equipments
  def create
    @equipment = Equipment.new(params[:equipment])
    if @equipment.save
      flash[:notice] = "Equipment successfully created"
    else
    end
    respond_with(@equipment)
  end

  # DELETE /equipments/1
  def destroy
    @equipment = Equipment.find(params[:id])
    flash[:notice] = "Equipment successfully destroyed." if @equipment.destroy
    respond_with(@equipment, :location => equipments_url)
  end

  # GET /equipments/1/edit
  def edit
    @equipment = Equipment.find(params[:id])
    respond_with(@equipment) do |format|
      format.html { render :action => :edit }
    end
  end

  # GET /equipments
  def index
    @equipments = Equipment.all.page(params[:page]).per(5)
    respond_with(@equipments)
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
    @equipment.write_attributes(params[:equipment])
    load_equipment_items_products
    flash[:notice] = "Equipment successfully updated." if @equipment.save
    respond_with(@equipment)
  end
private
  def load_equipment_items_products
    @equipment.items.each do |equipment_item|
      equipment_item.load_products if equipment_item.name_changed?
    end
  end
end

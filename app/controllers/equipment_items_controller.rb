class EquipmentItemsController < ApplicationController
  respond_to :html, :js
  before_filter :find_equipment
  before_filter :find_equipment_item

  # POST /equipment_items
  def create
    @equipment_item = EquipmentItem.new(params[:equipment_item])
    if @equipment_item.save
      flash[:notice] = "EquipmentItem successfully created"
      respond_with(@equipment_item, :location => equipments_url)
    else
      respond_with(@equipment_item)
    end
  end

  # DELETE /equipment_items/1
  def destroy
    flash[:notice] = "EquipmentItem successfully destroyed." if @equipment_item.destroy
    respond_with(@equipment_item, :location => equipments_url)
  end

  # SHOW /equipment_items/1
  def show
  end

  # PUT /equipment_items/1
  def update
    flash[:notice] = "EquipmentItem successfully updated." if @equipment_item.update_attributes(params[:equipment_item])
    respond_with(@equipment_item, :location => equipments_url)
  end
private
  def find_equipment
    @equipment = Equipment.find(params[:equipment_id]) if params[:equipment_id]
  end

  def find_equipment_item
    if params[:id]
      if @equipment
        @equipment_item = @equipment.items.find(params[:id])
      else
        @equipment_item = EquipmentItem.find(params[:id])
      end
    end
  end
end

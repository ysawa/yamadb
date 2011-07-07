class EquipmentItemsController < ApplicationController
  respond_to :html, :js

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
    @equipment_item = EquipmentItem.find(params[:id])
    flash[:notice] = "EquipmentItem successfully destroyed." if @equipment_item.destroy
    respond_with(@equipment_item, :location => equipments_url)
  end

  # PUT /equipment_items/1
  def update
    @equipment_item = EquipmentItem.find(params[:id])
    flash[:notice] = "EquipmentItem successfully updated." if @equipment_item.update_attributes(params[:equipment_item])
    respond_with(@equipment_item, :location => equipments_url)
  end
end

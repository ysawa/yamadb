require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe EquipmentItemsController do

  # This should return the minimal set of attributes required to create a valid
  # EquipmentItem. As you add validations to EquipmentItem, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new EquipmentItem" do
        expect {
          post :create, :equipment_item => valid_attributes
        }.to change(EquipmentItem, :count).by(1)
      end

      it "assigns a newly created equipment_item as @equipment_item" do
        post :create, :equipment_item => valid_attributes
        assigns(:equipment_item).should be_a(EquipmentItem)
        assigns(:equipment_item).should be_persisted
      end

      it "redirects to the created equipment_item" do
        post :create, :equipment_item => valid_attributes
        response.should redirect_to(equipments_url)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved equipment_item as @equipment_item" do
        # Trigger the behavior that occurs when invalid params are submitted
        EquipmentItem.any_instance.stub(:save).and_return(false)
        post :create, :equipment_item => {}
        assigns(:equipment_item).should be_a_new(EquipmentItem)
      end

      it "re-renders the 'new' template" do
        pending "VALIDATION NOT IMPLEMENTED"
        # Trigger the behavior that occurs when invalid params are submitted
        EquipmentItem.any_instance.stub(:save).and_return(false)
        post :create, :equipment_item => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested equipment_item" do
        equipment_item = EquipmentItem.create! valid_attributes
        # Assuming there are no other equipment_items in the database, this
        # specifies that the EquipmentItem created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        EquipmentItem.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => equipment_item.id, :equipment_item => {'these' => 'params'}
      end

      it "assigns the requested equipment_item as @equipment_item" do
        equipment_item = EquipmentItem.create! valid_attributes
        put :update, :id => equipment_item.id, :equipment_item => valid_attributes
        assigns(:equipment_item).should eq(equipment_item)
      end

      it "redirects to the equipment_item" do
        equipment_item = EquipmentItem.create! valid_attributes
        put :update, :id => equipment_item.id, :equipment_item => valid_attributes
        response.should redirect_to(equipments_url)
      end
    end

    describe "with invalid params" do
      it "assigns the equipment_item as @equipment_item" do
        equipment_item = EquipmentItem.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        EquipmentItem.any_instance.stub(:save).and_return(false)
        put :update, :id => equipment_item.id.to_s, :equipment_item => {}
        assigns(:equipment_item).should eq(equipment_item)
      end

      it "re-renders the 'edit' template" do
        pending "VALIDATION NOT IMPLEMENTED"
        equipment_item = EquipmentItem.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        EquipmentItem.any_instance.stub(:save).and_return(false)
        put :update, :id => equipment_item.id.to_s, :equipment_item => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested equipment_item" do
      equipment_item = EquipmentItem.create! valid_attributes
      expect {
        delete :destroy, :id => equipment_item.id.to_s
      }.to change(EquipmentItem, :count).by(-1)
    end

    it "redirects to the equipment_items list" do
      equipment_item = EquipmentItem.create! valid_attributes
      delete :destroy, :id => equipment_item.id.to_s
      response.should redirect_to(equipments_url)
    end
  end

end

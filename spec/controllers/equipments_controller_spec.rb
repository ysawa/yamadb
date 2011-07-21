require 'spec_helper'

describe EquipmentsController do
  def valid_attributes
    attrs = Fabricate.build(:equipment).attributes
    attrs.delete(:_id)
    attrs
  end

  describe "GET index" do
    it "assigns all equipments as @equipments" do
      equipment = Equipment.create! valid_attributes
      get :index
      assigns(:equipments).should eq([equipment])
    end
  end

  describe "GET show" do
    it "assigns the requested equipment as @equipment" do
      equipment = Equipment.create! valid_attributes
      get :show, :id => equipment.id.to_s
      assigns(:equipment).should eq(equipment)
    end
  end

  describe "GET new" do
    describe 'if not signed in' do
      it 'cannot be accessed' do
        get :new
        response.should redirect_to(new_user_session_path)
      end
    end

    describe 'if signed in' do
      before do
        login_user
      end

      it 'can be accessed' do
        get :new
        response.should be_success
      end

      it "assigns a new equipment as @equipment" do
        get :new
        assigns(:equipment).should be_a_new(Equipment)
      end
    end
  end

  describe "GET edit" do
    describe 'if not signed in' do
      it 'cannot be accessed' do
        equipment = Equipment.create! valid_attributes
        get :edit, :id => equipment.id.to_s
        response.should redirect_to(new_user_session_path)
      end
    end

    describe 'if signed in' do
      before do
        login_user
      end

      it "assigns the requested equipment as @equipment" do
        equipment = Equipment.create! valid_attributes
        get :edit, :id => equipment.id.to_s
        assigns(:equipment).should eq(equipment)
      end
    end
  end

  describe "POST create" do
    describe 'if not signed in' do
      it 'cannot be accessed' do
        post :create, :equipment => valid_attributes
        response.should redirect_to(new_user_session_path)
      end
    end

    describe 'if signed in' do
      before do
        login_user
      end

      describe "with valid params" do
        it "creates a new Equipment" do
          expect {
            post :create, :equipment => valid_attributes
          }.to change(Equipment, :count).by(1)
        end

        it "assigns a newly created equipment as @equipment" do
          post :create, :equipment => valid_attributes
          assigns(:equipment).should be_a(Equipment)
          assigns(:equipment).should be_persisted
        end

        it "redirects to the created equipment" do
          post :create, :equipment => valid_attributes
          response.should redirect_to(Equipment.last)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved equipment as @equipment" do
          # Trigger the behavior that occurs when invalid params are submitted
          Equipment.any_instance.stub(:save).and_return(false)
          post :create, :equipment => {}
          assigns(:equipment).should be_a_new(Equipment)
        end

        it "re-renders the 'new' template" do
          pending "VALIDATION NOT IMPLEMENTED"
          # Trigger the behavior that occurs when invalid params are submitted
          Equipment.any_instance.stub(:save).and_return(false)
          post :create, :equipment => {}
          response.should render_template("new")
        end
      end
    end
  end

  describe "PUT update" do
    describe 'if not signed in' do
      it 'cannot be accessed' do
        equipment = Equipment.create! valid_attributes
        put :update, :id => equipment.id, :equipment => {'these' => 'params'}
        response.should redirect_to(new_user_session_path)
      end
    end

    describe 'if signed in' do
      before do
        login_user
      end

      describe "with valid params" do
        it "updates the requested equipment" do
          equipment = Equipment.create! valid_attributes
          Equipment.any_instance.should_receive(:write_attributes).with({'these' => 'params'})
          put :update, :id => equipment.id, :equipment => {'these' => 'params'}
        end

        it "assigns the requested equipment as @equipment" do
          equipment = Equipment.create! valid_attributes
          put :update, :id => equipment.id, :equipment => valid_attributes
          assigns(:equipment).should eq(equipment)
        end

        it "redirects to the equipment" do
          equipment = Equipment.create! valid_attributes
          put :update, :id => equipment.id, :equipment => valid_attributes
          response.should redirect_to(Equipment.last)
        end
      end

      describe "with invalid params" do
        it "assigns the equipment as @equipment" do
          equipment = Equipment.create! valid_attributes
          Equipment.any_instance.stub(:save).and_return(false)
          put :update, :id => equipment.id.to_s, :equipment => {}
          assigns(:equipment).should eq(equipment)
        end

        it "re-renders the 'edit' template" do
          pending "VALIDATION NOT IMPLEMENTED"
          equipment = Equipment.create! valid_attributes
          Equipment.any_instance.stub(:save).and_return(false)
          put :update, :id => equipment.id.to_s, :equipment => {}
          response.should render_template("edit")
        end
      end
    end
  end

  describe "DELETE destroy" do
    describe 'if not signed in' do
      it 'cannot be accessed' do
        equipment = Equipment.create! valid_attributes
        delete :destroy, :id => equipment.id, :equipment => {'these' => 'params'}
        response.should redirect_to(new_user_session_path)
      end
    end

    describe 'if signed in' do
      before do
        login_user
      end

      it "destroys the requested equipment" do
        equipment = Equipment.create! valid_attributes
        expect {
          delete :destroy, :id => equipment.id.to_s
        }.to change(Equipment, :count).by(-1)
      end

      it "redirects to the equipments list" do
        equipment = Equipment.create! valid_attributes
        delete :destroy, :id => equipment.id.to_s
        response.should redirect_to(equipments_url)
      end
    end
  end
end

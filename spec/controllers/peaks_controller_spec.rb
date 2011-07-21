require 'spec_helper'

describe PeaksController do
  def valid_attributes
    attrs = Fabricate.build(:peak).attributes
    attrs.delete(:_id)
    attrs
  end

  describe "GET index" do
    it "assigns all peaks as @peaks" do
      peak = Peak.create! valid_attributes
      get :index
      assigns(:peaks).should eq([peak])
    end
  end

  describe "GET show" do
    it "assigns the requested peak as @peak" do
      peak = Peak.create! valid_attributes
      get :show, :id => peak.id.to_s
      assigns(:peak).should eq(peak)
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

      it "assigns a new peak as @peak" do
        get :new
        assigns(:peak).should be_a_new(Peak)
      end
    end
  end

  describe "GET edit" do
    describe 'if not signed in' do
      it 'cannot be accessed' do
        peak = Peak.create! valid_attributes
        get :edit, :id => peak.id.to_s
        response.should redirect_to(new_user_session_path)
      end
    end

    describe 'if signed in' do
      before do
        login_user
      end

      it "assigns the requested peak as @peak" do
        peak = Peak.create! valid_attributes
        get :edit, :id => peak.id.to_s
        assigns(:peak).should eq(peak)
      end
    end
  end

  describe "POST create" do
    describe 'if not signed in' do
      it 'cannot be accessed' do
        post :create, :peak => valid_attributes
        response.should redirect_to(new_user_session_path)
      end
    end

    describe 'if signed in' do
      before do
        login_user
      end

      describe "with valid params" do
        it "creates a new Peak" do
          expect {
            post :create, :peak => valid_attributes
          }.to change(Peak, :count).by(1)
        end

        it "assigns a newly created peak as @peak" do
          post :create, :peak => valid_attributes
          assigns(:peak).should be_a(Peak)
          assigns(:peak).should be_persisted
        end

        it "redirects to the created peak" do
          post :create, :peak => valid_attributes
          response.should redirect_to(peaks_url)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved peak as @peak" do
          Peak.any_instance.stub(:save).and_return(false)
          post :create, :peak => {}
          assigns(:peak).should be_a_new(Peak)
        end

        it "re-renders the 'new' template" do
          Peak.any_instance.stub(:save).and_return(false)
          post :create, :peak => {}
          response.should_not be_success
        end
      end
    end
  end

  describe "PUT update" do
    describe 'if not signed in' do
      it 'cannot be accessed' do
        peak = Peak.create! valid_attributes
        put :update, :id => peak.id, :peak => {'these' => 'params'}
        response.should redirect_to(new_user_session_path)
      end
    end

    describe 'if signed in' do
      before do
        login_user
      end

      describe "with valid params" do
        it "updates the requested peak" do
          peak = Peak.create! valid_attributes
          Peak.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
          put :update, :id => peak.id, :peak => {'these' => 'params'}
        end

        it "assigns the requested peak as @peak" do
          peak = Peak.create! valid_attributes
          put :update, :id => peak.id, :peak => valid_attributes
          assigns(:peak).should eq(peak)
        end

        it "redirects to the peak" do
          peak = Peak.create! valid_attributes
          put :update, :id => peak.id, :peak => valid_attributes
          response.should redirect_to(peaks_url)
        end
      end

      describe "with invalid params" do
        it "assigns the peak as @peak" do
          peak = Peak.create! valid_attributes
          Peak.any_instance.stub(:save).and_return(false)
          put :update, :id => peak.id.to_s, :peak => {}
          assigns(:peak).should eq(peak)
        end

        it "re-renders the 'edit' template" do
          peak = Peak.create! valid_attributes
          Peak.any_instance.stub(:save).and_return(false)
          put :update, :id => peak.id.to_s, :peak => {}
          response.should_not be_success
        end
      end
    end
  end

  describe "DELETE destroy" do
    describe 'if not signed in' do
      it 'cannot be accessed' do
        peak = Peak.create! valid_attributes
        delete :destroy, :id => peak.id, :peak => {'these' => 'params'}
        response.should redirect_to(new_user_session_path)
      end
    end

    describe 'if signed in' do
      before do
        login_user
      end

      it "destroys the requested peak" do
        peak = Peak.create! valid_attributes
        expect {
          delete :destroy, :id => peak.id.to_s
        }.to change(Peak, :count).by(-1)
      end

      it "redirects to the peaks list" do
        peak = Peak.create! valid_attributes
        delete :destroy, :id => peak.id.to_s
        response.should redirect_to(peaks_url)
      end
    end
  end
end

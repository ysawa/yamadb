require 'spec_helper'

describe RecordsController do
  def valid_attributes
    record = Fabricate.build(:record).attributes
    record.delete(:_id)
    record
  end

  describe "GET index" do
    it "assigns all records as @records" do
      record = Record.create! valid_attributes
      get :index
      assigns(:records).should eq([record])
    end
  end

  describe "GET show" do
    it "assigns the requested record as @record" do
      record = Record.create! valid_attributes
      get :show, :id => record.id.to_s
      assigns(:record).should eq(record)
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

      it "assigns a new record as @record" do
        get :new
        assigns(:record).should be_a_new(Record)
      end
    end
  end

  describe "GET edit" do
    describe 'if not signed in' do
      it 'cannot be accessed' do
        record = Record.create! valid_attributes
        get :edit, :id => record.id.to_s
        response.should redirect_to(new_user_session_path)
      end
    end

    describe 'if signed in' do
      before do
        login_user
      end

      it "assigns the requested record as @record" do
        record = Record.create! valid_attributes
        get :edit, :id => record.id.to_s
        assigns(:record).should eq(record)
      end
    end
  end

  describe "POST create" do
    describe 'if not signed in' do
      it 'cannot be accessed' do
        post :create, :record => valid_attributes
        response.should redirect_to(new_user_session_path)
      end
    end

    describe 'if signed in' do
      before do
        login_user
      end

      describe "with valid params" do
        it "creates a new Record" do
          expect {
            post :create, :record => valid_attributes
          }.to change(Record, :count).by(1)
        end

        it "assigns a newly created record as @record" do
          post :create, :record => valid_attributes
          assigns(:record).should be_a(Record)
          assigns(:record).should be_persisted
        end

        it "redirects to the created record" do
          post :create, :record => valid_attributes
          response.should redirect_to(Record.last)
        end

        it "the created record has created_by" do
          post :create, :record => valid_attributes
          Record.last.created_by.should == User.last
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved record as @record" do
          # Trigger the behavior that occurs when invalid params are submitted
          Record.any_instance.stub(:save).and_return(false)
          post :create, :record => {}
          assigns(:record).should be_a_new(Record)
        end

        it "re-renders the 'new' template" do
          pending 'NOT IMPLEMENTED'
          # Trigger the behavior that occurs when invalid params are submitted
          Record.any_instance.stub(:save).and_return(false)
          post :create, :record => {}
          response.should render_template("new")
        end
      end
    end
  end

  describe "PUT update" do
    describe 'if not signed in' do
      it 'cannot be accessed' do
        record = Record.create! valid_attributes
        put :update, :id => record.id, :record => {'these' => 'params'}
        response.should redirect_to(new_user_session_path)
      end
    end

    describe 'if signed in' do
      before do
        login_user
      end

      describe "with valid params" do
        it "updates the requested record" do
          record = Record.create! valid_attributes
          Record.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
          put :update, :id => record.id, :record => {'these' => 'params'}
        end

        it "assigns the requested record as @record" do
          record = Record.create! valid_attributes
          put :update, :id => record.id, :record => valid_attributes
          assigns(:record).should eq(record)
        end

        it "redirects to the record" do
          record = Record.create! valid_attributes
          put :update, :id => record.id, :record => valid_attributes
          response.should redirect_to(record)
        end
      end

      describe "with invalid params" do
        it "assigns the record as @record" do
          record = Record.create! valid_attributes
          Record.any_instance.stub(:save).and_return(false)
          put :update, :id => record.id.to_s, :record => {}
          assigns(:record).should eq(record)
        end

        it "re-renders the 'edit' template" do
          pending 'NOT IMPLEMENTED'
          record = Record.create! valid_attributes
          Record.any_instance.stub(:save).and_return(false)
          put :update, :id => record.id.to_s, :record => {}
          response.should render_template("edit")
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

      it "destroys the requested record" do
        record = Record.create! valid_attributes
        expect {
          delete :destroy, :id => record.id.to_s
        }.to change(Record, :count).by(-1)
      end

      it "redirects to the records list" do
        record = Record.create! valid_attributes
        delete :destroy, :id => record.id.to_s
        response.should redirect_to(records_url)
      end
    end
  end

end

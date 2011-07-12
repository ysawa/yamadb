require "spec_helper"

describe EquipmentItemsController do
  describe "routing" do

    it "routes to #index" do
      get("/equipment_items").should route_to("equipment_items#index")
    end

    it "routes to #new" do
      get("/equipment_items/new").should route_to("equipment_items#new")
    end

    it "routes to #show" do
      get("/equipment_items/1").should route_to("equipment_items#show", :id => "1")
      get("/equipments/1/equipment_items/2").should route_to("equipment_items#show", :equipment_id => '1', :id => "2")
    end

    it "routes to #edit" do
      get("/equipment_items/1/edit").should route_to("equipment_items#edit", :id => "1")
    end

    it "routes to #create" do
      post("/equipment_items").should route_to("equipment_items#create")
    end

    it "routes to #update" do
      put("/equipment_items/1").should route_to("equipment_items#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/equipment_items/1").should route_to("equipment_items#destroy", :id => "1")
    end

  end
end

require "spec_helper"

describe EquipmentsController do
  describe "routing" do

    it "routes to #index" do
      get("/equipments").should route_to("equipments#index")
    end

    it "routes to #new" do
      get("/equipments/new").should route_to("equipments#new")
    end

    it "routes to #show" do
      get("/equipments/1").should route_to("equipments#show", :id => "1")
    end

    it "routes to #edit" do
      get("/equipments/1/edit").should route_to("equipments#edit", :id => "1")
    end

    it "routes to #create" do
      post("/equipments").should route_to("equipments#create")
    end

    it "routes to #update" do
      put("/equipments/1").should route_to("equipments#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/equipments/1").should route_to("equipments#destroy", :id => "1")
    end

  end
end

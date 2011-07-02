require "spec_helper"

describe PeaksController do
  describe "routing" do

    it "routes to #index" do
      get("/peaks").should route_to("peaks#index")
    end

    it "routes to #new" do
      get("/peaks/new").should route_to("peaks#new")
    end

    it "routes to #show" do
      get("/peaks/1").should route_to("peaks#show", :id => "1")
    end

    it "routes to #edit" do
      get("/peaks/1/edit").should route_to("peaks#edit", :id => "1")
    end

    it "routes to #create" do
      post("/peaks").should route_to("peaks#create")
    end

    it "routes to #update" do
      put("/peaks/1").should route_to("peaks#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/peaks/1").should route_to("peaks#destroy", :id => "1")
    end

  end
end

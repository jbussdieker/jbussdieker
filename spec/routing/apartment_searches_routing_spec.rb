require "spec_helper"

describe ApartmentSearchesController do
  describe "routing" do

    it "routes to #index" do
      get("/apartment_searches").should route_to("apartment_searches#index")
    end

    it "routes to #new" do
      get("/apartment_searches/new").should route_to("apartment_searches#new")
    end

    it "routes to #show" do
      get("/apartment_searches/1").should route_to("apartment_searches#show", :id => "1")
    end

    it "routes to #edit" do
      get("/apartment_searches/1/edit").should route_to("apartment_searches#edit", :id => "1")
    end

    it "routes to #create" do
      post("/apartment_searches").should route_to("apartment_searches#create")
    end

    it "routes to #update" do
      put("/apartment_searches/1").should route_to("apartment_searches#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/apartment_searches/1").should route_to("apartment_searches#destroy", :id => "1")
    end

  end
end

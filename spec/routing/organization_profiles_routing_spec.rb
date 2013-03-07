require "spec_helper"

describe OrganizationProfilesController do
  describe "routing" do

    it "routes to #index" do
      get("/organization_profiles").should route_to("organization_profiles#index")
    end

    it "routes to #new" do
      get("/organization_profiles/new").should route_to("organization_profiles#new")
    end

    it "routes to #show" do
      get("/organization_profiles/1").should route_to("organization_profiles#show", :id => "1")
    end

    it "routes to #edit" do
      get("/organization_profiles/1/edit").should route_to("organization_profiles#edit", :id => "1")
    end

    it "routes to #create" do
      post("/organization_profiles").should route_to("organization_profiles#create")
    end

    it "routes to #update" do
      put("/organization_profiles/1").should route_to("organization_profiles#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/organization_profiles/1").should route_to("organization_profiles#destroy", :id => "1")
    end

  end
end

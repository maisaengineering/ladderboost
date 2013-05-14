require "spec_helper"

describe MessagesCommentsController do
  describe "routing" do

    it "routes to #index" do
      get("/messages_comments").should route_to("messages_comments#index")
    end

    it "routes to #new" do
      get("/messages_comments/new").should route_to("messages_comments#new")
    end

    it "routes to #show" do
      get("/messages_comments/1").should route_to("messages_comments#show", :id => "1")
    end

    it "routes to #edit" do
      get("/messages_comments/1/edit").should route_to("messages_comments#edit", :id => "1")
    end

    it "routes to #create" do
      post("/messages_comments").should route_to("messages_comments#create")
    end

    it "routes to #update" do
      put("/messages_comments/1").should route_to("messages_comments#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/messages_comments/1").should route_to("messages_comments#destroy", :id => "1")
    end

  end
end

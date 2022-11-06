require "rails_helper"

RSpec.describe NdrsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/ndrs").to route_to("ndrs#index")
    end

    it "routes to #new" do
      expect(get: "/ndrs/new").to route_to("ndrs#new")
    end

    it "routes to #show" do
      expect(get: "/ndrs/1").to route_to("ndrs#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/ndrs/1/edit").to route_to("ndrs#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/ndrs").to route_to("ndrs#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/ndrs/1").to route_to("ndrs#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/ndrs/1").to route_to("ndrs#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/ndrs/1").to route_to("ndrs#destroy", id: "1")
    end
  end
end

require "rails_helper"

RSpec.describe EntriesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/entries").to route_to("entries#index")
    end

    it "routes to #create" do
      expect(:post => "/entries").to route_to("entries#create")
    end

    it "routes to #destroy" do
      expect(:delete => "/entries/1").to route_to("entries#destroy", :id => "1")
    end

  end
end

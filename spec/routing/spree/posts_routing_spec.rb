require "rails_helper"

RSpec.describe Spree::PostsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/spree/posts").to route_to("spree/posts#index")
    end

    it "routes to #new" do
      expect(:get => "/spree/posts/new").to route_to("spree/posts#new")
    end

    it "routes to #show" do
      expect(:get => "/spree/posts/1").to route_to("spree/posts#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/spree/posts/1/edit").to route_to("spree/posts#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/spree/posts").to route_to("spree/posts#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/spree/posts/1").to route_to("spree/posts#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/spree/posts/1").to route_to("spree/posts#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/spree/posts/1").to route_to("spree/posts#destroy", :id => "1")
    end

  end
end

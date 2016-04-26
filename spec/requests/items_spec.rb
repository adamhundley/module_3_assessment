require 'rails_helper'

RSpec.describe "Items Actions", type: :request do
  describe "GET /api/v1/items" do
    before(:each) do
      @items = [Item.create(name: "adam1", description: "description1", image_url: "test.url.1"), Item.create(name: "adam2", description: "description2", image_url: "test.url.2"), Item.create(name: "adam3", description: "description3", image_url: "test.url.3")]
    end

    it "has 200 response code" do
      get '/api/v1/items'
      expect(response).to have_http_status(200)
    end
  #
    it "renders json" do
      get '/api/v1/items'
      expect(response.content_type).to eq("application/json")
    end

    it "returns information on all items" do
      get '/api/v1/items'

      items = JSON.parse(response.body, symbolize_names: true)
      parsed_item = items.first

      expect(items.count).to eq 3
      expect(parsed_item.keys).to eq [:name, :description, :image_url]
      expect(parsed_item[:name]).to eq("adam1")
      expect(parsed_item[:description]).to eq("description1")
      expect(parsed_item[:image_url]).to eq("test.url.1")
    end
  end

  describe "GET /api/v1/item/1" do
    before(:each) do
      @items = [Item.create(name: "adam1", description: "description1", image_url: "test.url.1"), Item.create(name: "adam2", description: "description2", image_url: "test.url.2"), Item.create(name: "adam3", description: "description3", image_url: "test.url.3")]
    end

    it "has 200 response code" do
      get '/api/v1/items/1'
      expect(response).to have_http_status(200)
    end
  #
    it "renders json" do
      get '/api/v1/items/1'
      expect(response.content_type).to eq("application/json")
    end

    it "returns information on a specific item" do
      get '/api/v1/items/1'

      item = JSON.parse(response.body, symbolize_names: true)

      expect(item.keys).to eq [:name, :description, :image_url]
      expect(item[:name]).to eq("adam1")
      expect(item[:description]).to eq("description1")
      expect(item[:image_url]).to eq("test.url.1")
    end
  end

  describe "DELETE /api/v1/item/1" do
    before(:each) do
      @items = [Item.create(name: "adam1", description: "description1", image_url: "test.url.1"), Item.create(name: "adam2", description: "description2", image_url: "test.url.2"), Item.create(name: "adam3", description: "description3", image_url: "test.url.3")]
    end

    it "has 204 response code" do
      delete '/api/v1/items/1'
      expect(response).to have_http_status(200)
    end
  #
    it "renders json" do
      delete '/api/v1/items/1'
      expect(response.content_type).to eq("application/json")
    end

    it "returns information on a specific item" do
      delete '/api/v1/items/1'

      item = JSON.parse(response.body, symbolize_names: true)

      expect(item.keys).to eq [:name, :description, :image_url]
      expect(item[:name]).to eq("adam1")
      expect(item[:description]).to eq("description1")
      expect(item[:image_url]).to eq("test.url.1")
    end
  end
end

#
# When I send a GET request to /api/v1/items I receive a 200 JSON response containing all items And each item has a name, description, and image_url but not the created_at or updated_at

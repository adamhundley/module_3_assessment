require 'rails_helper'

RSpec.describe "Items Actions", type: :request do
  describe "GET /api/v1/items" do
    # before(:each) do
    #   @customer = create(:customer, first_name: "Adam")
    # end

    it "has 200 response code" do
      get '/api/v1/items'
      expect(response).to have_http_status(200)
    end
  #
    it "renders json" do
      get '/api/v1/items'
      expect(response.content_type).to eq("application/json")
    end

    it "returns information on a customer" do
      get '/api/v1/items'

      items = JSON.parse(response.body, symbolize_names: true)
      parsed_item = items.first

      expect(items.count).to eq Items.count
      expect(parsed_item.keys).to eq [:name, :description, :image_url]
      expect(parsed_item[:name]).to eq("Adam")
      expect(parsed_item[:description]).to eq("Adam")
      expect(parsed_item[:image_url]).to eq("Adam")
    end
  end
end

#
# When I send a GET request to /api/v1/items I receive a 200 JSON response containing all items And each item has a name, description, and image_url but not the created_at or updated_at

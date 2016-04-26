require 'rails_helper'

RSpec.feature "UserSearchesForProducts", type: :feature do
  before(:each) do

  end

  scenario "User visits home page and searches for a product" do
    # VCR.use_cassette("feature#product_search") do

        visit "/"
        fill_in "product", with: "sennheiser"
        click_on "search"

        expect(current_path).to eq "/search"
        within("div#product-9678429") do
          expect(page).to have_content "Sennheiser - Camera-Mount Wireless Microphone System - Black"
          expect(page).to have_content "$629.95"
        end

      # As a user When I visit the "/" And I fill in the search box with "sennheiser" and click "search" Then my current path should be "/search" And I should see exactly 15 results And each result should contain sku, name, customer average review, short description, sale price, and image ONLY
    # end
  end
end

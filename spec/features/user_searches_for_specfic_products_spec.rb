require 'rails_helper'

RSpec.feature "UserSearchesForProducts", type: :feature do
  before(:each) do

  end

  scenario "User visits home page and searches for a product" do
    VCR.use_cassette("feature#specifc_product_search") do
      visit "/"
      fill_in "product", with: "sennheiser headphones white"
      click_on "search"

      expect(current_path).to eq "/search"
      within("div#product-9068155") do
        expect(page).to have_content "Sennheiser - CX 2.00G Earbud Headphones - White"
        expect(page).to have_content "$54.95"
        expect(page).to have_content "SKU: 9068155"
        expect(page).to have_content "Avg Review: "
      end
    end
  end
end

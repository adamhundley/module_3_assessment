require 'rails_helper'

RSpec.feature "UserSearchesForProducts", type: :feature do
  before(:each) do

  end

  scenario "User visits home page and searches for a product" do
    VCR.use_cassette("feature#unknown_product_search") do
      visit "/"
      fill_in "product", with: "poop"
      click_on "search"

      expect(current_path).to eq "/search"
      expect(page).to have_content "Sorry! It seems we can't find poop. Search again!"
    end
  end
end

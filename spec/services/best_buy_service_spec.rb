require 'rails_helper'

describe BestBuyService do
  context "#find" do
    scenario "returns a collection of products" do
      VCR.use_cassette("best_buy_service#fine") do
        service = BestBuyService.new
        products = service.find("sennheiser")
        product = products.first

        expect(product.keys).to eq [:sku, :name, :customerReviewAverage,
                                    :shortDescription, :salePrice,
                                    :image]
        expect(product[:sku]).to eq 9678429
        expect(product[:name]).to eq "Sennheiser - Camera-Mount Wireless Microphone System - Black"
        expect(product[:customerReviewAverage]).to eq nil
        expect(product[:shortDescription]).to eq "SENNHEISER Camera-Mount Wireless Microphone System: Invisible clip-on microphone; sturdy metal housing; automatic frequency management; easy-to-read illuminated display; 4-level battery indicator; 626-668MHz frequency range"
        expect(product[:salePrice]).to eq 629.95
        expect(product[:image]).to eq "http://img.bbystatic.com/BestBuy_US/images/products/9678/9678429_sa.jpg"
      end
    end
  end
end

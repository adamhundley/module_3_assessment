class Product

  def self.find(product)
    service.find(product)
  end

  def self.service
    BestBuyService.new
  end
end

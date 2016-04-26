class Product

  def initialize(product_info)
    @sku = product_info[:sku]
    @name = product_info[:name]
    @customer_average_review = product_info[:customerReviewAverage]
    @short_description = product_info[:shortDescription]
    @sale_price = product_info[:salePrice]
    @image = product_info[:image]
  end

  def self.find(product)
    products = service.find(product)
    make_objects(products)
  end

  def self.service
    BestBuyService.new
  end

  def self.make_objects(products)
    products.map do |product_info|
      Product.new(product_info)
    end
  end
end

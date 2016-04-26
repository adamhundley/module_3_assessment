class BestBuyService
  def initialize
    @_apikey = ENV["best_buy_api_key"]
    @_connection = Faraday.new("https://api.bestbuy.com/v1")
  end

  def find(product)
    require "pry"; binding.pry
    response = connection.get do |req|
      req.url "/products(search=#{product})"
      req.params['apiKey'] = api_key
      req.params['format'] = "json"
      req.params['pageSize'] = 15
      req.params['show'] = "sku,name,customerReviewAverage,shortDescription,salePrice,image"
    end
      parse(response.body)
  end

# https://api.bestbuy.com/v1/products(longDescription=iPhone*|sku=7619002)?show=sku,name&pageSize=15&page=5&apiKey=z2ehwc7a6wvbg8n7sbmu7nuy&format=json'
private

  def connection
    @_connection
  end

  def api_key
    "z2ehwc7a6wvbg8n7sbmu7nuy"
  end

  def parse(response)
    JSON.parse(response, symbolize_names: true)
  end

end

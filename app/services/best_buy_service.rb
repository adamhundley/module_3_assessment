class BestBuyService
  def initialize
    @_apikey = ENV["best_buy_api_key"]
    @_connection = Faraday.new("https://api.bestbuy.com")
  end

  def find(product)
    response = connection.get do |req|
      req.url "/v1/products(longDescription=#{product}*)"
      req.params['format'] = "json"
      req.params['show'] = "sku,name,customerReviewAverage,shortDescription,salePrice,image"
      req.params['pageSize'] = 15
      req.params['apiKey'] = api_key
    end
      parse(response.body)[:products]
  end

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

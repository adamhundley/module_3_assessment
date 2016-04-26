class SearchController < ApplicationController
  def index
    @products = Product.find(params[:product])
    if @products.empty?
      
    end
  end
end

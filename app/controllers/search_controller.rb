class SearchController < ApplicationController
  def index
    @products = Product.find(params[:product])
  end
end

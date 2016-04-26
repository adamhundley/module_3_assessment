class SearchController < ApplicationController
  def index
    @products = Product.find(params[:product])
    if @products.empty?
      flash[:notice] = "Sorry! #{params[:product]} couldn't be found! Search again"
    end
  end
end

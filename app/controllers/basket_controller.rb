class BasketController < ApplicationController
  def add
    if cookies["basket"]
      basket = ActiveSupport::JSON.decode(cookies["basket"])
    else
      basket = {}
    end
    basket[params[:product][:id]] = basket[params[:product][:id]] ? basket[params[:product][:id]].to_i + params[:product][:quantity].to_i : params[:product][:quantity].to_i
    cookies["basket"] = ActiveSupport::JSON.encode(basket)
    redirect_to :back
  end

  def delete
  end

  def index
    @basket = ActiveSupport::JSON.decode(cookies["basket"])
    ids = @basket.collect {|elem| elem[0]}
    @products = Product.find(ids)
    @order = Order.new
  end
end

class BuyersController < ApplicationController
  
  def index
    @products = Product.all
    @cart_item = current_cart.cart_items.new
    @order_item = current_order.order_items.new
  end

  def show
    @product = Product.find(params[:id])
  end
  
end

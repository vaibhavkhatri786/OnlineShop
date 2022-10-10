class CartItemsController < ApplicationController
  def create
    @cart = current_cart
    @cart_item = @cart.cart_items.new(cart_params) 
    @cart.save
    session[:cart_id] = @cart.id
  end

  def update
    @cart = current_cart
    @cart_item = @cart.cart_items.find(params[:id])
    @cart_item.update(cart_params)
    @cart_items = current_cart.cart_items
    redirect_to carts_path(@cart)
  end

  # def show
  #   @cart = current_cart
  #   @cart_item = @cart.cart_items.find(params[:id])
  #   @cart_item.destroy
  #   @cart_items = current_cart.cart_items
  #   redirect_to carts_path(@cart)
  # end

  def destroy
    byebug
    @cart = current_cart
    @cart_item = @cart.cart_items.find(params[:id])
    @cart_item.destroy
    @cart_items = current_cart.cart_items
    redirect_to carts_path(@cart)
  end

  private
  def cart_params
    params.require(:cart_item).permit(:product_id, :quantity)
  end
end

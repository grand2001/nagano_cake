class Public::CartItemsController < ApplicationController
  def index
   @customer = current_customer
   @cart_item = CartItem.where(customer_id: current_customer)
   @total = @cart_item.inject(0) { |sum, item| sum + item.sum_of_price }
  end

  def create
   @cart_item = CartItem.new(cart_item_params)
   @cart_item.save
   redirect_to cart_items_path
  end

  def update
   @cart_item = CartItem.find(params[:id])
   @cart_item.update(cart_item_params)
   redirect_to cart_items_path
  end

  def cancel
   @cart_item = CartItem.find(params[:id])
   @cart_item.destroy
   redirect_to cart_items_path
  end

  def all_cancel
   @customer = current_customer
   @cart_item = CartItem.where(customer_id: current_customer)
   @cart_item.destroy_all
   redirect_to cart_items_path
  end

  private

  def cart_item_params
   params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end
end

class Public::OrdersController < ApplicationController
 before_action :authenticate_customer!

  def show
   @order = Order.find(params[:id])
  end

  def index
   @orders = Order.where(customer_id: current_customer.id)
  end

  def new
   @order = Order.new
  end

  def confirm
   @cart_items = current_customer.cart_items
   @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
   @cartage = @total + 800
   @order = Order.new(order_params)
   if params[:order][:address_option] == '0'
     @order.postal_code = current_customer.postal_code
     @order.address = current_customer.address
     @order.name = current_customer.first_name + current_customer.last_name
   elsif params[:order][:address_option] == '1'
    @address = Address.find(params[:order][:address_id])
     @order.postal_code = @address.postal_code
     @order.address = @address.address
     @order.name = @address.name
   elsif params[:order][:address_option] == '2'

   else
    render :new

   end
  end

  def create
   cart_items = current_customer.cart_items.all
   @order = current_customer.orders.new(order_params)
   if @order.save
    cart_items.each do |cart|
     order_informations = OrderInformation.new
     order_informations.item_id = cart.item_id
     order_informations.order_id = @order.id
     order_informations.amount = cart.amount
     order_informations.purchase_price = cart.item.price
     order_informations.save
    end
    redirect_to orders_thanks_path
    cart_items.destroy_all
   else
    @order = Order.new(order_params)
    render :new
   end
  end

  def thanks
  end

  private

  def order_params
   params.require(:order).permit(:customer_id, :postal_code, :address, :cartage, :price, :name, :payment_method)
  end
end

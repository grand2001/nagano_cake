class Public::AddressesController < ApplicationController
 before_action :authenticate_customer!

 def index
  @customer = current_customer
  @address = Address.new
  @addresses = Address.where(customer_id: current_customer)
 end

 def edit
  @address = Address.find(params[:id])
 end

 def create
  @address = Address.new(address_params)
  @address.customer_id = current_customer.id
  if @address.save
   redirect_to addresses_path
  else
   @customer = current_customer
   @addresses = Address.where(customer_id: current_customer)
   render 'public/addresses/index'
  end
 end

 def update
  @address = Address.find(params[:id])
  @address.update(address_params)
  redirect_to addresses_path
 end

 def destroy
  @customer = current_customer
  @address = Address.find(params[:id])
  @address.destroy
  redirect_to addresses_path
 end

 def address_params
   params.require(:address).permit(:customer_id, :postal_code, :address, :name)
 end

end

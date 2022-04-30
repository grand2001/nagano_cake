class Public::CustomersController < ApplicationController
 def show
  @customer = current_customer
 end

 def edit
  @customer = current_customer
 end

 def update
  @customer = current_customer
  @customer.update(customer_params)
  redirect_to customer_path(@customer.id)
 end

 def confimation
  @customer = current_customer
 end

 def withdrawal
  @customer = current_customer
  @customer.update(is_deleted: true)
  redirect_to items_path
 end

 def customer_params
   params.require(:customer).permit(:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number)
 end
end
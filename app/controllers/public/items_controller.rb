class Public::ItemsController < ApplicationController
  def index
   @item = Item.page(params[:page]).per(8)
   @items = Item.all
  end

  def show
   @item = Item.find(params[:id])
   @cart_item = CartItem.all
  end

  private

  def item_params
  params.require(:item).permit(:price, :introduction, :name, :image)
  end
end

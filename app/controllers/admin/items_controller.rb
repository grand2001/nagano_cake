class Admin::ItemsController < ApplicationController
 before_action :authenticate_admin!

  def index
   @items = Item.page(params[:page])
   @genre = Genre.all
  end

  def new
   @item = Item.new
   @genre = Genre.all
  end

  def show
   @genre = Genre.page(params[:page])
   @item = Item.find(params[:id])
  end

  def edit
   @genre = Genre.find(params[:id])
   @genres = Genre.all
   @item = Item.find(params[:id])
  end

  def create
   @item = Item.new(item_params)
   if @item.save
    redirect_to admin_item_path(@item.id)
   else
    @items = Item.page(params[:page])
    @genre = Genre.all
    render 'admin/items/new'
   end
  end

  def update
   @genre = Genre.find(params[:id])
   @item = Item.find(params[:id])
   if @item.update(item_params)
    redirect_to admin_item_path(@item.id)
   else
    @genres = Genre.all
    render 'admin/items/edit'
   end
  end


 private

 def item_params
  params.require(:item).permit(:genre_id, :price, :introduction, :name, :image)
 end

end

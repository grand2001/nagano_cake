class Public::HomesController < ApplicationController
  def about
  end

  def top
   @item = Item.all
   @item = Item.all.order(created_at: :desc).limit(4)
  end
end

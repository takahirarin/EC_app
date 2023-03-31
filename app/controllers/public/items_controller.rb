class Public::ItemsController < ApplicationController
  def index
    if(@posts)
      @items=@posts
    else
      @items = Item.all
    end
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
end

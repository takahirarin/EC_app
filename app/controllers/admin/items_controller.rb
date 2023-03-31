class Admin::ItemsController < ApplicationController

  def index
    @items = Item.search(params[:search])
    # if(@posts)
    #   @items=@posts
    # else
    #   @items = Item.all
    # end
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_item_path(@item)
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  def update
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :description, :is_sales, :genre_id, :image)
  end

end

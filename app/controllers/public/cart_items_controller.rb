class Public::CartItemsController < ApplicationController
  def create
    @cart_items=current_end_user.cart_items.all
    @cart_item = CartItem.new(cart_item_params)

    @cart_items.each do |item|
      if(item.item_id == @cart_item.item_id)
        @cart_item.end_user_id = current_end_user.id
        new_amount = item.amount + @cart_item.amount
        item.update_attribute(:amount, new_amount)
        redirect_to cart_items_path and return
      end
    end

    @cart_item.end_user_id = current_end_user.id
    @cart_item.save
    redirect_to cart_items_path
  end

  def index
    @cart_items=current_end_user.cart_items.all
    @cart_item = CartItem.new

    @total=0
    @cart_items.each do |item|
      @total += item.item.price*item.amount
    end
    @total=@total.*(1.1).round

  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_update_params)
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    CartItem.destroy_all
    redirect_to cart_items_path
  end


  private

  def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id)
  end

  def cart_item_update_params
    params.permit(:amount)
  end


end

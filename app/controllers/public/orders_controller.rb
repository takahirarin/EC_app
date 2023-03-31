class Public::OrdersController < ApplicationController
  before_action :not_empty?, only:[:new]
  def new
    @order = Order.new
    @user = current_end_user
  end

  def confirm
    @order = Order.new(order_params)
    @order.end_user_id = current_end_user.id
    @items = current_end_user.cart_items.all
    amount=0
      @items.each do |item|
        amount += item.item.price * item.amount
      end
    @order.billing_amount = amount*(1.1).round + @order.shipping_fee

    if  params[:order][:address_option] == "0"
     @order.adress = current_end_user.address
     @order.postal_code = current_end_user.postal_code
     @order.name = (current_end_user.second_name + current_end_user.first_name)


    elsif params[:order][:address_option] == "1"
     @address=Address.find_by(params[:adress])
     @order.adress = @address.addresses
     @order.postal_code = @address.postal_code
     @order.name = @address.name


    elsif params[:order][:address_option] == "2"
       @order2=Order.new(order2_params)
       @order.name = @order2.name
       @order.adress = @order2.adress
       @order.postal_code = @order2.postal_code
    end
  end

  def done
  end

  def create
    @order=Order.new(order_create_params)
    @order.save

    @cart_items=CartItem.all

    @cart_items.each do |cart_item|
      @order_detail=OrderDetail.new
      @order_detail.order_id=@order.id
      @order_detail.item_id=cart_item.item_id
      @order_detail.amount=cart_item.amount
      @order_detail.price=@order.billing_amount
      @order_detail.save!
    end
    @cart_items.delete_all
    redirect_to done_path
  end

  def index
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:payment)
  end

  def order2_params
    params.require(:order).permit(:payment, :name, :postal_code, :adress)
  end

  def order_create_params
    params.require(:order).permit(:payment, :name, :postal_code, :adress, :billing_amount, :end_user_id)
  end

  def not_empty?
    if(current_end_user.cart_items.size==0)
      redirect_to cart_items_path
    end
  end
end

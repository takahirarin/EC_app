class Admin::OrdersController < ApplicationController
  def show
    @order=Order.find(params[:id])
    @order_details=@order.order_details.all
  end


  def update
    @order=Order.find(params[:id])
    @order_details=@order.order_details.all

    if( params[:order][:order_status]=="confirm")
      @order_details.each do |order_detail|
        order_detail.production_status=1
        order_detail.save
      end
    end
    @order.update(order_params)
    binding.pry
    redirect_back(fallback_location: root_path)

  end

  private

  def order_params
    params.require(:order).permit(:order_status)
  end
end

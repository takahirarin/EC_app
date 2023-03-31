class Admin::OrderDetailsController < ApplicationController
  def update
    @order=Order.find(params[:order_id])
    @order_detail=OrderDetail.find_by(params[:id])

    if( params[:order_detail][:production_status]=="under_constraction")
      @order.order_status=2
      @order.save
    end

    @order_detail.update(order_detail_params)


    @i=0

    # @order.order_details.each do |order_detail|
    #   if(order_detail.production_status==3)
    #     @order.order_status=3
    #   else
    #     @order.order_status=2
    #     break
    #   end
    # end
    # @order.save


    @order.order_details.each do |order_detail|
      if(order_detail.production_status=="completed")
        @i=@i+1
      end
    end

    if(@i==@order.order_details.size)
      @order.order_status=3
      @order.save
    end

    redirect_back(fallback_location: root_path)
  end

  private

    def order_detail_params
      params.require(:order_detail).permit(:production_status)
    end

end

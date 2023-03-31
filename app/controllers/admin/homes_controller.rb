class Admin::HomesController < ApplicationController
	def top
		@order_details=OrderDetail.all
		@orders=Order.all
		# order.end_user.cart_item
		# CartItem.find_by(end_user_id: order.end_user)
	end
end

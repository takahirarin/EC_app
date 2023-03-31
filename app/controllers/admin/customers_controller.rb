class Admin::CustomersController < ApplicationController
	def index
		@end_users = EndUser.all
	end
end

class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	# before_action :search

	def after_sign_in_path_for(resource_or_scope)
			case resource
					when Admin
				      admin_top_path
				  when EndUser
				      mypage_path
			end
	end

	def after_sign_out_path_for(resource_or_scope)
		if resource_or_scope == :admin
			new_admin_session_path
		else
			root_path
		end
	end

	def configure_permitted_parameters
    	devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :first_name_kana, :second_name, :second_name_kana, :postal_code, :address, :phone_number])
	end

  # def search
  #   #Viewのformで取得したパラメータをモデルに渡す
  #   @posts = Item.search(params[:search])
  # end
end

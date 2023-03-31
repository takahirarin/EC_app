class Public::EndUsersController < ApplicationController
	def show

	end

	def edit
		@user = current_end_user
	end

	def update
		@user = current_end_user
		if @user.update(end_user_params)
			redirect_to mypage_path
		else
			@user = current_end_user
			render 'public/end_users/edit'
		end
	end

	def confirm
	end

	def withdraw
		@user=current_end_user
		@user.update(is_deleted: true)
		reset_session
		redirect_to root_path
	end

	private

	def end_user_params
		params.require(:end_user).permit(:first_name, :first_name_kana, :second_name, :second_name_kana, :postal_code, :address, :phone_number,:email)
	end

end

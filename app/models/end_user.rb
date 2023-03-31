class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :cart_items
  has_many :addresses
  has_many :orders

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  [:first_name, :first_name_kana, :second_name, :second_name_kana, :postal_code, :phone_number, :address, :email].each do |v|
      validates v, presence: true
   end

   def active_for_authentication?
    super && (self.is_deleted == false)
   end

end

class EndUser::ParameterSanitizer < Devise::ParameterSanitizer
  def sign_in
    default_params.permit(:second_name, :first_name, :second_name_kana, :first_name_kana, :postal_code, :address, :phone_number) #追加したいパラメータ
  end


end
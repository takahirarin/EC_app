class Public::AddressesController < ApplicationController
  def index
    @address = current_end_user.addresses.all
    @new_address = Address.new
  end

  def create
    @address=Address.new(address_params)
    @address.end_user_id = current_end_user.id
    @address.save
    redirect_to addresses_path
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
     @address = Address.find(params[:id])
     @address.update(address_params)
     redirect_to addresses_path
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to addresses_path
  end

  private
  def address_params
    params.require(:address).permit(:name, :addresses, :postal_code)
  end
end

class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new

    if current_user == @item.user
      redirect_to root_path
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:image, :postal_code, :prefecture_id, :municipality, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end

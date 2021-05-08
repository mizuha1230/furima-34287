class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_order_address, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
    redirect_to root_path if current_user == @item.user
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_order_address
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_address).permit(:image, :postal_code, :prefecture_id, :municipality, :house_number, :building_name, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end

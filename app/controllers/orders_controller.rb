class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id || @item.order.present?

    @order_shipping = OrderShipping.new
  end

  def new
    @order_shipping = OrderShipping.new
  end



  def create
    @item = Item.find(params[:item_id])
    @order_shipping = OrderShipping.new(order_shipping_params)
    if @order_shipping.valid?
      @order_shipping.save
      redirect_to root_path
    else

      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_shipping_params
    params.require(:order_shipping).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id)
  end
end

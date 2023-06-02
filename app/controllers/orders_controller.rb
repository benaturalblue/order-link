class OrdersController < ApplicationController
  
  def index
    @orders = Order.all
  end
  
  def new
    @order = Order.new
    @order.order_items.build
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to root_path
    else
      render :new
    end
  end
    

  private
  def order_params
    params.require(:order).permit(:delivery_day, :sending_user_id, 
      order_items_attributes:[:item_name, :amount, :memo, :_destroy])
      .merge(user_id: current_user.id)
  end
end

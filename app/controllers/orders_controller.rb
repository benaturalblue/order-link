class OrdersController < ApplicationController
  
  def new
    @order = Order.new
  end
  
  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to root_path
    else
      render action: :new
    end
  end
    
    
  private
  
  def order_params
    params.require(:order).permit(:item_name, :amount, :delivery_day, :memo).merge(user_id: current_user.id, sending_user_id: params[:sending_user_id])
  end
  
end

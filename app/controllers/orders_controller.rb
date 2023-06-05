class OrdersController < ApplicationController
  
  def index
    @orders = Order.all
    @matched_orders = @orders.select { |order| order.sending_user_id == current_user.id || order.user_id == current_user.id }
  end
  
  def new
    @order = Order.new
    @order.order_items.build
  end

  def create
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    if @order.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  def edit
    @order = Order.find(params[:id])
    if @order.user_id == current_user.id
      render :edit
    else
      redirect_to root_path
    end
  end
  
  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to order_path(@order)
    else
      render :edit
    end
  end
  
  
  def destroy
    @order = Order.find(params[:id])
    if current_user == @order.user
      @order.order_items.destroy_all
      @order.destroy
      redirect_to root_path
    else
      redirect_to order_path
    end
  end
  
  def show
    @order = Order.includes(:order_items).find(params[:id])
    @comment = Comment.new
    @comments = @order.comments.includes(:user)
  end
    

  private
  def order_params
    params.require(:order).permit(:delivery_day, :sending_user_id, 
      order_items_attributes:[:id, :item_name, :amount, :memo, :_destroy])
      .merge(user_id: current_user.id)
  end
end

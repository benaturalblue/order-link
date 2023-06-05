class UsersController < ApplicationController
  before_action :authenticate_user!, only: :show
  
  def show
    @user = current_user
    @orders = Order.where(user_id: current_user.id)
    @matched_orders = Order.where(sending_user_id: current_user.id)
  end
  
end

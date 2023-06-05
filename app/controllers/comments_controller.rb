class CommentsController < ApplicationController
  def create
    binding.pry
    @order = Order.find(params[:order_id])
    @comment = @order.comments.build(comment_params)
    if @comment.save
      redirect_to order_path(@order)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id)
  end
end

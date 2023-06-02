class AddSendingUserIdToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :sending_user_id, :integer
  end
end

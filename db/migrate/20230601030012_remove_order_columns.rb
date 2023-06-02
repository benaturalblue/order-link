class RemoveOrderColumns < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :item_name, :string
    remove_column :orders, :amount, :integer
    remove_column :orders, :memo, :string
  end
end

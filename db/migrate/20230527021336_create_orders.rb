class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string     :item_name,       null: false
      t.integer    :amount,          null: false
      t.date       :delivery_day,    null: false
      t.string     :memo
      t.references :user,            null: false, foreign_key:true
      t.timestamps
    end
  end
end

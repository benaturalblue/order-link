class CreateOrderItems < ActiveRecord::Migration[6.0]
  def change
    create_table :order_items do |t|
      t.string :item_name, null: false
      t.integer :amount,   null: false
      t.string :memo,      null: false
      t.references :order, null: false, foreign_key:true
      t.timestamps
    end
  end
end

class CreateSendingUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :sending_users do |t|
      t.references :order, null: false, foreign_key:true
      t.references :user,  null: false, foreign_key:true
      t.timestamps
    end
  end
end

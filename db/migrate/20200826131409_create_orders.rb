class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: { to_table: :users }
      t.references :product, null: false, foreign_key: { to_table: :products }
      t.integer :amount, null: false
      
      t.timestamps
    end
  end
end

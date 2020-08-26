class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.references :seller, null: false, foreign_key: { to_table: :users }
      t.string :name, null: false
      t.integer :quantity, null: false
      t.string :code, null: false

      t.timestamps
    end
  end
end

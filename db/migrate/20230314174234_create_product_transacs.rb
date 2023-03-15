class CreateProductTransacs < ActiveRecord::Migration[7.0]
  def change
    create_table :product_transacs do |t|
      t.integer :quantity
      t.integer :discount
      t.integer :price
      t.integer :product_id
      t.integer :transaction_id

      t.timestamps
    end
  end
end

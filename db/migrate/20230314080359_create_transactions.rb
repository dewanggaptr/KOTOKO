class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.integer :cashier_id

      t.timestamps
    end
  end
end

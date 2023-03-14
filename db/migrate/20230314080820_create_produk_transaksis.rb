class CreateProdukTransaksis < ActiveRecord::Migration[7.0]
  def change
    create_table :produk_transaksis do |t|
      t.integer :total
      t.integer :discount
      t.integer :produk_id
      t.integer :transaksi_id

      t.timestamps
    end
  end
end

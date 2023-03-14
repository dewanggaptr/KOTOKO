class CreateTransaksis < ActiveRecord::Migration[7.0]
  def change
    create_table :transaksis do |t|
      t.integer :jumlah_barang
      t.integer :kasir_id

      t.timestamps
    end
  end
end

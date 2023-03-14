class CreateProduks < ActiveRecord::Migration[7.0]
  def change
    create_table :produks do |t|
      t.string :nama_produk
      t.text :deskripsi_produk
      t.integer :harga
      t.integer :stok
      t.integer :kategori_id

      t.timestamps
    end
  end
end

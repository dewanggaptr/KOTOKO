class CreateKategoris < ActiveRecord::Migration[7.0]
  def change
    create_table :kategoris do |t|
      t.string :nama_kategori
      t.text :deskripsi

      t.timestamps
    end
  end
end

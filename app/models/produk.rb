class Produk < ApplicationRecord
    has_many :produk_transaksi, dependant: :destroy
    belongs_to :kategori

    validates :nama, presence: true, lenght: {maximum: 50}
    validates :deskripsi, presence: true, lenght: {maximum: 00}
    validates :harga, presence: true
    validates :stok, presence: true

    def new_attributes
        {
            id: self.id,
            nama: self.nama,
            deskripsi: self.deskripsi,
            harga: self.harga,
            stok: self.stok,
            kategori: self.kategori,
            created_at: self.created_at,
            updated_at: self.updated_at,


        }
    end

end

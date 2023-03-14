class Kategori < ApplicationRecord

    has_many :produk, dependant: :destroy

    validates :nama_kategori, presence: true, lenght: {maximum: 50}

    def new_attributes
        {
            id: self.id,
            nama: self.nama ,
            created_at: self.created_at,
        }
    end

end

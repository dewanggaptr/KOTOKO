class Kasir < ApplicationRecord
    has_secure_password

    has_many:transaksi, dependant: :destroy

    validates :nama, presence: true, length: {maximum: 50}
    validates :email, presence: true, lenght: {maximum:50},
                        format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                        uniqueness: true 
    validates :password_digest, presence: true, lenght: {minimum: 8}


    def new_attributes
        {
            id: self.id,
            nama: self.nama,
            email: self.email,
            created_at: self.created_at,

        }
    end
end
class Cashier < ApplicationRecord
  has_secure_password

  has_many :transactions, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum:50 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: true
  validates :password_digest, presence: true, length: { minimum: 8 }

  def new_attributes
    {
      id: self.id,
      name: self.name,
      email: self.email,
      created_at: self.created_at
    }
  end
end

class Transaction < ApplicationRecord
  has_many :product_transacs
  has_many :products, through: :product_transac, source: :product
  belongs_to :cashier

  validates :cashier_id, presence: true

  def new_attributes
    {
      id: self.id,
      cashier: self.cashier,
      created_at: self.created_at,
      updated_at: self.updated_at
    }
  end
end

class Transaction < ApplicationRecord
  has_many :our_transactions, class_name: 'ProductTransac', foreign_key: 'transaction_id'
  has_many :products, through: :our_transactions, source: :our_product
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

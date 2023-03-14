class Product < ApplicationRecord
  has_many :product_transacs
  has_many :transactions, through: :product_transac, source: :transaction
  belongs_to :category

  validates :name, presence: true, length: { maximum: 50 }
  validates :description, length: { maximum: 100 }
  validates :price, presence: true
  validates :stock, presence: true
  validates :category_id, presence: true

  def new_attributes
    {
      id: self.id,
      name: self.name,
      description: self.description,
      price: self.price,
      stock: self.stock,
      category: self.category,
      created_at: self.created_at,
      updated_at: self.updated_at
    }
  end
end

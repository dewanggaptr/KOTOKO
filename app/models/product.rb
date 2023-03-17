class Product < ApplicationRecord
  has_many :our_products, class_name: 'ProductTransac', foreign_key: 'product_id'
  has_many :transactions, through: :our_products, source: :our_transaction
  belongs_to :category

  validates :name, presence: true, length: { maximum: 50 }, uniqueness: true
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

class ProductTransac < ApplicationRecord
  belongs_to :our_transaction, class_name: "Transaction", foreign_key: "transaction_id"
  belongs_to :our_product, class_name: "Product", foreign_key: "product_id"
  
  validates :quantity, presence: true
  validates :discount, presence:true
  validates :price, presence: true
  validates :transaction_id, presence: true
  validates :product_id, presence: true
  
  def new_attributes
    {
      id: self.id,
      quantity: self.quantity,
      discount: self.discount,
      price: self.price,
      transaction: self.our_transaction,
      product: self.our_product
    }
  end
end

class Category < ApplicationRecord
  has_many :products, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }, uniqueness: true

  def new_attributes
    {
      id: self.id,
      name: self.name,
      created_at: self.created_at
    }
  end
end

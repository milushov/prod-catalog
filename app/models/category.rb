class Category < ActiveRecord::Base
  has_many :products, -> { order('products.created_at desc') }

  validates :name, length: { minimum: 2 }
end

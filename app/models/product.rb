class Product < ActiveRecord::Base
  belongs_to :category
  has_many :reviews, -> { order('reviews.updated_at desc') }

  default_scope -> { order('products.updated_at desc') }

  validates :title, length: { minimum: 2 }
  validates :description, length: { minimum: 2 }
end

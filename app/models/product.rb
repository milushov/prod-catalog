class Product < ActiveRecord::Base
  belongs_to :category
  has_many :reviews

  validates :title, length: { minimum: 2 }
  validates :descripiton, length: { minimum: 2 }
end

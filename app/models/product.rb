class Product < ActiveRecord::Base
  belongs_to :category
  has_many :reviews

  validates :title, length: { minimum: 2 }
  validates :description, length: { minimum: 2 }
end

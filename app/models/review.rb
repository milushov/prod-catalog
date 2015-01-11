class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  default_scope -> { order('created_at desc') }
  validates :msg, length: { minimum: 2 }
end

class Product < ApplicationRecord
    has_many :bill_items
    validates :product_code, presence: true, uniqueness: true
end
  
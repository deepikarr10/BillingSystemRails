class Customer < ApplicationRecord
    has_many :bills, dependent: :destroy
    validates :email, presence: true
    validates :name, presence: true
end
  
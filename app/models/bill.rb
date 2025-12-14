class Bill < ApplicationRecord
  belongs_to :customer
  has_many :bill_items, dependent: :destroy

  def calculate_totals!
    self.total_price = bill_items.sum{ |item| item.quantity * item.unit_price }
    self.total_tax   = bill_items.sum(:tax_amount)
    self.net_price   = bill_items.sum(:total_price)
    self.balance_amount = paid_amount - net_price
    save!
  end
end

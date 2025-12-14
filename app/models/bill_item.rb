class BillItem < ApplicationRecord
  belongs_to :bill
  belongs_to :product

  def purchase_price
    unit_price * quantity
  end
end

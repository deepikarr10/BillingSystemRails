class CreateBills < ActiveRecord::Migration[7.1]
  def change
    create_table :bills do |t|
      t.references :customer, null: false, foreign_key: true
      t.float :total_price
      t.float :total_tax
      t.float :net_price
      t.float :paid_amount
      t.float :balance_amount

      t.timestamps
    end
  end
end

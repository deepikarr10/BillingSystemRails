class BillsController < ApplicationController
    def index
      if params[:email].present?
        customer = Customer.find_by(email: params[:email])
        @bills = customer ? customer.bills.order(created_at: :desc) : []
      else
        @bills = Bill.order(created_at: :desc)
      end
    end
  
    def new
      @bill = Bill.new
    end
    
    def create
      customer = Customer.find_or_create_by!(name: params[:name],email: params[:email])
  
      @bill = customer.bills.create!(paid_amount: params[:paid_amount])
  
      params[:items].each do |item|
        product = Product.find_by(product_code: item[:product_code])
  
        next unless product
  
        quantity = item[:quantity].to_i
        price = product.price * quantity
        tax = price * product.tax_percentage / 100.0
  
        @bill.bill_items.create!(
          product: product,
          quantity: quantity,
          unit_price: product.price,
          tax_amount: tax,
          total_price: price + tax
        )
      end
  
      @bill.calculate_totals!
      
      if Rails.env.development?
        SendInvoiceJob.perform_now(@bill.id)
      else
        SendInvoiceJob.perform_later(@bill.id)
      end
      
      redirect_to bill_path(@bill)
    end
  
    def show
      @bill = Bill.find(params[:id])
      if @bill.balance_amount < 0
        @denominations = {}
      else
        @denominations = calculate_denominations(@bill.balance_amount.to_i)
      end      
    end
  
    private
  
    def calculate_denominations(amount)
      notes = [500, 50, 20, 10, 5, 2, 1]
      result = {}
  
      notes.each do |note|
        result[note] = amount / note
        amount %= note
      end
  
      result
    end
  end
  
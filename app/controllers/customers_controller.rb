class CustomersController < ApplicationController
  def index
    # 1. Load all customers for dropdown / list
    @customers = Customer.order(:email)

    # 2. Find customer by selected email
    if params[:email].present?
      @customer = Customer.find_by(email: params[:email])
    end

    # 3. Load selected bill with items
    if params[:bill_id].present? && @customer.present?
      @selected_bill = @customer.bills
                                .includes(bill_items: :product)
                                .find_by(id: params[:bill_id])
    end
  end
end

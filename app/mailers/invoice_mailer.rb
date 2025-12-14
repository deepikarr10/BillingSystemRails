class InvoiceMailer < ApplicationMailer
    def invoice_email(bill)
      @bill = bill
      mail(to: bill.customer.email, subject: "Your Invoice")
    end
end

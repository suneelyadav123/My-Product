class OrderMailer < ApplicationMailer
	default from: 'notifications@example.com'
 
  def send_email(email ,order_items)

    @email = email
    @order_items = order_items

    mail(to: email, subject: 'Alert! Your Order Items Have Updated')
  end
end

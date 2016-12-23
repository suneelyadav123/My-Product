class OrderMailer < ApplicationMailer
	default from: 'notifications@example.com'
 
  def send_email(email)
  	binding.pry
    @email = email
    mail(to: email, subject: 'Alert! Your Order Items Have Updated')
  end
end

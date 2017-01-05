class OrderItem < ActiveRecord::Base
  
  belongs_to :order
  # before_destroy :check_order_item
  # before_create :send_notification_email
  #after_create :send_notification_email

  

  def check_order_item

  	binding.pry
  	@order_items = self
  	email = self.order.email
  	self.order.send_notification_email(@order_items)
 	 OrderMailer.send_email(email , @order_items).deliver_now 
  	
  end
  
end
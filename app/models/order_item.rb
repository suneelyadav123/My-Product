class OrderItem < ActiveRecord::Base
  belongs_to :order ,  dependent: :destroy
  after_update :send_email_after_change

  def send_email_after_change
  	email = self.order.email
  	OrderMailer.send_email(email).deliver_now if (self.changed? && self.changed? == true)
  end

end
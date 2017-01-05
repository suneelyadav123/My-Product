class Order < ActiveRecord::Base
  belongs_to :customer
  has_many :order_items 
  #before_create :set_order_num
  accepts_nested_attributes_for :customer
  accepts_nested_attributes_for :order_items , :allow_destroy => true 
  
   #before_update :check_record_deleted
   #after_commit :send_notification_email

    def self.total_order(date)
      
      where("date  "  , date).pluck(:id)
      
    end 
    
  	def set_order_num
  		self.date = rand(1.months).from_now
      @date = self.date
  		daily_order_count = Order.where('date BETWEEN ? AND ?', @date.beginning_of_day, @date.end_of_day).count+1
  		self.order_num = @date.strftime("%Y%m%d") + "%02d" %daily_order_count
      self.lat =  rand(-90.000000000...90.000000000)
      self.lng =   rand(-180.000000000...180.000000000)
      self.price = rand(0.00 ... 100)
  
  	end

    def send_notification_email(order_items)
      binding.pry
      email = self.email
      OrderMailer.send_email(email, order_items).deliver_now
      # return OrderMailer.send_email(email , order_items, destroy_items).deliver_now  if order_items.present? && destroy_items.present?
      # OrderMailer.send_email(email , order_items).deliver_now if order_items.present?
      # OrderMailer.send_email(email, destroy_items).deliver_now if destroy_items.present?
    end
    # def check_record_deleted
    #   order_items = []
    #   @order.order_items.each{|a| order_items.push a if a.marked_for_destruction?}
    #   binding.pry
    # end
    def say_hello
      "Hello World!"
    end
    
end
class Order < ActiveRecord::Base
  belongs_to :customer
  has_many :order_items , :dependent => :destroy
  before_create :set_order_num
  accepts_nested_attributes_for :customer
  accepts_nested_attributes_for :order_items , :allow_destroy => true 
  

  	def set_order_num
  		@date = self.date
  		daily_order_count = Order.where('date BETWEEN ? AND ?', @date.beginning_of_day, @date.end_of_day).count+1
  		self.order_num = @date.strftime("%Y%m%d") + "%02d" %daily_order_count
  	end
    
end
class Customer < ActiveRecord::Base
	has_many :orders
	  accepts_nested_attributes_for :orders, :allow_destroy => true
	    validates :first_name, presence: true
	  #before_create :set_lat_and_lng

	  def set_lat_and_lng
	  	 self.lat =  rand(-90.000000000...90.000000000)
	  	 self.lng =   rand(-180.000000000...180.000000000)
	  end
end

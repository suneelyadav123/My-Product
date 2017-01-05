require 'csv'
require 'active_support/core_ext/date/conversions'

  namespace :customers do   
     desc "importing customers and orders using csv"
     task :import => [:environment] do 
			CSV.foreach("#{Rails.root}/public/seed_data/customer2.csv", :headers => true, encoding:'iso-8859-1:utf-8') do |row|
				p row[0]
				p row[1]
				customers = Customer.where(first_name: row[0] , last_name: row[1]).first_or_create!
					customers.orders.where(description: row[3]).first_or_create!
				
    		end
		end
	end
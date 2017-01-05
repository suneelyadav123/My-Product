
  namespace :customer do   
     desc "50 Random customers are getting created using Faker Gem"
     task :import => [:environment] do 
			50.times do 
  			    Customer.create!(
                   first_name: Faker::Name.unique.name,
                   last_name: Faker::Name.name,
                   address_line1: Faker::Address.street_name,
                   address_line2: Faker::Address.street_address,
                   zip_code: Faker::Address.zip_code,
                   state: Faker::Address.state,
                   lat: Faker::Address.latitude,
                   lng: Faker::Address.longitude,

    
   				 )
  			end
		end
	end
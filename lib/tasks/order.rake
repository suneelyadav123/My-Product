
namespace :order do   
  desc "80 Random orders are getting created with 3 OrderItems for each Order using Faker Gem"
  task :import => [:environment] do 
    100.times do 
    	    order = Order.create!(
                 description: Faker::Lorem.sentence(3),
                 lat: Faker::Address.latitude,
                 email: Faker::Internet.email,
                 lng: Faker::Address.longitude,
                 order_num: Faker::Number.number(10),
                 date: Faker::Date.between(30.days.from_now, Date.today),
                 customer_id: rand(1 .. 50)
                      
    			   
                 )
           3.times { order.order_items.create!( item_number: Faker::Number.number(1) ,
                                                description: Faker::Lorem.sentence(3) ,
                                                 quantity:Faker::Number.number(1),
                                                 price: Faker::Number.decimal(2) 
                                               )
                    }


     end
    end
end
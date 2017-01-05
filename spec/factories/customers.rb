FactoryGirl.define do 
	factory :customer do
  		first_name "John"
  		last_name "Doe"
	end
	factory :invalid_customer , parent: :customer do
  		first_name nil
  		last_name nil
	end
end
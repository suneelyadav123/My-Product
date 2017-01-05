require 'rails_helper'

RSpec.describe Order, type: :model do

	describe "say hello" do 
		it "returns hello world!" do 
			
			order = Order.new
			message = order.say_hello
			expect(message).to eq("Hello World!")
		end
	end
end


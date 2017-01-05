describe Order do 
   context “When testing the Order class” do 
      
      it "should say 'Hello World' when we call the say_hello method" do 
         hw = Order.new 
         message = hw.say_hello 
         expect(message).to eq "Hello World!"
      end
      
   end
end

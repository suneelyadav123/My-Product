class OrdersController < ApplicationController
	before_action  :set_order, only:[ :show , :edit ,:update , :destroy] 
	
	def index
		@orders = Order.includes(:customer).all
	end

	def show

	end

	def edit
		@order = Order.find(params[:id])
	end

	def new
		@order = Order.new
		3.times { @order.order_items.build}
	end

	def create
		@order = Order.new(order_params)
		respond_to do |format|
			if @order.save
				format.html { redirect_to @order , notice: 'Order Was Successfully Created'}
			else
				format.html { render :new}
				format.json { render json: @order.errors.messages.values.join(','), status: :unprocessable_entity }
			end
		end

	end

	def update
		order_items = @order.order_items
		#order_items=[]
		binding.pry
		respond_to do |format|		
	      if @order.update_attributes(order_params)
	  	      modified_items = order_items - @order.order_items || []
	  		  binding.pry
	  	 	  @order.order_items.collect {|a| modified_items.push a if a.changed?}
	  	 	  binding.pry		      		
	  		  @order.send_notification_email(modified_items) 

	         format.html { redirect_to @order, notice: 'Order was successfully updated.' }
	         format.json { render :show, status: :ok , location: @order }
	      else
	         format.html { render :edit }
	         format.json { render json: @order.errors.messages.values.join(','), status: :unprocessable_entity }
	      end
	  end
	end
	def destroy
	  @order.destroy
   		respond_to do |format|
      		format.html { redirect_to @order, notice: 'Customer was successfully destroyed.' }
      		format.json { head :no_content }
    	end
	end
	private

		def set_order
			@order = Order.find(params[:id])
		end

		def order_params
			params.require(:order).permit(:order_num , :date , :description, :lat , :lng , :customer_id ,:email, order_items_attributes: [:id, :item_number , :description , :quantity, :price , :order_id , :_destroy])
		end
end

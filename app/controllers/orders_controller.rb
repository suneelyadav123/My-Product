class OrdersController < ApplicationController
	before_action  :set_order, only:[ :show , :edit ,:update , :destroy] 
	
	def index
		@orders = Order.all
	end

	def show

	end

	def edit
		3.times { @order.order_items}
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

		respond_to do |format|		
	      if @order.update(order_params)

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
      		format.html { redirect_to order_url, notice: 'Customer was successfully destroyed.' }
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

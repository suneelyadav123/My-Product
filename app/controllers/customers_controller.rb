class CustomersController < ApplicationController
	before_action :set_customer , only:[:show , :edit , :update, :destroy]


	def index
		@customers = Customer.all 
	end 
	
	def edit

	end

	def show

	end
	
	def new
		@customer = Customer.new
		
	end
	
	def create
		@customer = Customer.new(customer_params)
		respond_to do |format|
			if @customer.save
				format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
        	else
        		format.html { render :new }
        		format.json { render json: @customer.errors.messages.values.join(','), status: :unprocessable_entity }
       		end
       	end
	end
	
	def update
	  respond_to do |format|
	    if @customer.update(customer_params)
	      format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
	      format.json { render :show, status: :ok, location: @customer }
	   else
	      format.html { render :edit }
	      format.json { render json: @customer.errors.messages.values.join(','), status: :unprocessable_entity }
	   end
	  end
   end

   def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  	def typeahead
  		
  		render json: Customer.where('first_name like ?', "#{params[:query]}%")

  	end
	
	private
	
	def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:first_name, :last_name, :address_line1 , :address_line2, :city, :state, :zip_code, :lat, :lng)
    end
end

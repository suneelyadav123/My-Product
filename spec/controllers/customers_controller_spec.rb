require 'rails_helper'

RSpec.describe CustomersController, type: :controller do

  describe "GET Index" do
    it "assigns all the customers to @customers" do 
      customer = FactoryGirl.create(:customer)
      get :index
      expect(assigns(:customers)).to eq([customer])
    end
    it "renders the index template" do 
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET Show" do 
    before :each do 
      @customer = FactoryGirl.create(:customer)
    end
    it "it assigns the requested customer to @customer" do 
      
      get :show , id: @customer
      expect(assigns(:customer)).to eq(@customer)
    end
    it "it renders the show template" do 
      get :show , id:@customer
      expect(response).to render_template('show')
    end
  end
  describe "GET #edit" do
    before :each do 
      @customer = FactoryGirl.create(:customer)
    end
    it "assigns the requested customer as @customer" do
      
      get :edit ,id: @customer
      expect(assigns(:customer)).to eq(@customer)
    end
    it "renders the edit template" do
      get :edit , id: @customer
      expect(response).to render_template("edit")
    end
  end

  describe "POST create" do
    context "with valid attributes" do
      it "creates a new customer" do

        expect{
        post :create, customer:  FactoryGirl.attributes_for(:customer)

        }.to change(Customer,:count).by(1)
      end
      it "redirects to show page" do
        post :create, customer: FactoryGirl.attributes_for(:customer)
         expect(response).to redirect_to Customer.last
      end
    end
    context "with invalid attributes" do
      it "does not save the new customer" do
        expect{
          post :create, customer: FactoryGirl.attributes_for(:invalid_customer)
        }.to_not change(Customer,:count)
      end
    
      it "re-renders the new method" do
        post :create, customer: FactoryGirl.attributes_for(:invalid_customer)
        expect(response).to render_template :new
      end
    end 
  end
  describe 'PUT update' do
    before :each do
      @customer = FactoryGirl.create(:customer, first_name: "Lawrence", last_name: "Smith")
    end
  
   context "valid attributes" do
      it "located the requested @customer" do
        put :update, {id: @customer, customer: FactoryGirl.attributes_for(:customer)}
        expect(assigns(:customer)).to eq(@customer)      
      end
  
      it "changes @customer's attributes" do
        put :update, {id: @customer, 
        customer: FactoryGirl.attributes_for(:customer, first_name: "Larry", last_name: "Smith")}
        @customer.reload
        expect(controller.notice).to eq('Customer was successfully updated.')

      end
  
      it "redirects to the updated customer" do
        put :update, {id: @customer, customer: FactoryGirl.attributes_for(:customer)}
        expect(response).to redirect_to @customer
      end
    end
  
    context "invalid attributes" do
      it "locates the requested @customer" do
        put :update, {id: @customer, customer: FactoryGirl.attributes_for(:invalid_customer)}
        expect(assigns(:customer)).to eq(@customer)      
      end
    
     it "does not change @customer's attributes" do
        put :update, {id: @customer, 
        customer: FactoryGirl.attributes_for(:customer, first_name: nil)}
        @customer.reload
        expect(@customer.first_name).not_to eq("Larry")
     end
    
      it "re-renders the edit method" do
        put :update, {id: @customer, customer: FactoryGirl.attributes_for(:invalid_customer)}
        expect(response).to render_template :edit
      end
    end
  end
  describe 'DELETE destroy' do
    before :each do
      @customer = FactoryGirl.create(:customer)
    end
  
    it "deletes the customer" do
      expect{
        delete :destroy, id: @customer        
      }.to change(Customer,:count).by(-1)
    end
    
    it "redirects to customers#index" do
      delete :destroy, id: @customer
      expect(response).to redirect_to customers_url
    end
  end
end
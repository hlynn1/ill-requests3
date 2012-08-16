require 'spec_helper'

describe "Customer pages" do
  
  subject { page }

  describe "new customer page" do
    before { visit new_customer_path }
    
    let(:submit) { "New Customer" }
    
    describe "with invalid information" do
      it "should not create a customer" do
        expect { click_button submit }.not_to change(Customer, :count)
      end
    end
    
    describe "with valid information" do
      before do
        fill_in "UserID", with: "9000123456"
        fill_in "First Name", with: "Example"
        fill_in "Last Name", with: "Customer"
        fill_in "Email", with: "customer@example.com"
      end
      
      it "should create a customer" do
        expect { click_button submit }. to change(Customer, :count).by(1)
      end
    end 
  end

end
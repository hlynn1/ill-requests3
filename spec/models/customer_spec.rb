require 'spec_helper'

describe Customer do
  before do
    @customer = Customer.new(userid: "9000123456", firstname: "Example", lastname: "User", 
                              email: "user@example.com")
  end

  subject { @customer }
  
  it { should respond_to(:userid) }
  it { should respond_to(:firstname) }
  it { should respond_to(:lastname) }
  it { should respond_to(:email) }

  it { should be_valid }
    
  describe "when UserID is not present" do
    before { @customer.userid = " " }
    it { should_not be_valid }
  end

  describe "when first name is not present" do
    before { @customer.firstname = " " }
    it { should_not be_valid }
  end
  
  describe "when last name is not present" do
    before { @customer.lastname = " " }
    it { should_not be_valid }
  end

  describe "when UserID is already in use" do
    before do
      customer_with_same_userid = @customer.dup
      customer_with_same_userid.save
    end
    it { should_not be_valid }
  end
  
end

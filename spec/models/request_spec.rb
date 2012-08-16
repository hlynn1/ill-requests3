require 'spec_helper'

describe Request do
  let(:user) { FactoryGirl.create(:user) }
  before do
    @request = Request.new(customer_id: user.id, oclcnum: 225679134, title: "A Great Book", 
                      author: "Smith, John", pub: "New York : 1999", locationplaced: "LH", location_id: 10, 
                      duedate: "2012-09-01", bclitem: 39878012345678)
  end

  subject { @request }
  
  it { should respond_to(:customer_id) }
  it { should respond_to(:oclcnum) }
  it { should respond_to(:title) }
  it { should respond_to(:author) }
  it { should respond_to(:pub) }
  it { should respond_to(:locationplaced) }
  it { should respond_to(:location_id) }
  it { should respond_to(:duedate) }
  it { should respond_to(:bclitem) }

  it { should be_valid }
  
  describe "when customer id is not present" do
    before { @request.customer_id = nil }
    it { should_not be_valid }
  end

  describe "when title is not present" do
    before { @request.title = " " }
    it { should_not be_valid }
  end
  
  describe "when pickup location is not present" do
    before { @request.location_id = " " }
    it { should_not be_valid }
  end

  describe "when OCLC# is too long" do
    before { @request.oclcnum = "1" * 11 }
    it { should_not be_valid }
  end
  
  describe "when locationplaced is too long" do
    before { @request.locationplaced = "a" * 4 }
    it { should_not be_valid }
  end
      
#  describe "return value of authentication method" do
#    before { @user.save }
#    let(:found_user) { User.find_by_locationcode(@user.locationcode) }
#    
#    describe "with valid password" do
#      it { should == found_user.authenticate(@user.password) }
#    end
#    
#    describe "with invalid password" do
#      let(:user_for_invalid_password) { found_user.authenticate("invalid") }
#      
#      it { should_not == user_for_invalid_password }
#      specify { user_for_invalid_password.should be_false }
#    end
#  end

end

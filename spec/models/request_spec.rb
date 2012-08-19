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
  it { should respond_to(:activities) }

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

  describe "activity associations" do
    before { @request.save }
    let!(:older_activity) do
      FactoryGirl.create(:activity, request: @request, status_id: 1)
    end
    let!(:newer_activity) do
      FactoryGirl.create(:activity, request: @request, status_id: 2)
    end
    
    it "should have the right activities in the right order" do
      @request.activities.should == [newer_activity, older_activity]
    end
  end

end

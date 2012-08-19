require 'spec_helper'

describe Activity do

  let(:request) { FactoryGirl.create(:request) }
  before { @activity = request.activities.build(status_id: 2) }
  
  subject { @activity }
  
  it { should respond_to(:status_id) }
  it { should respond_to(:request_id) }
  it { should respond_to(:request) }
  its(:request) { should == request }

  it { should be_valid }
  
  describe "accessible attributes" do
    it "should not allow access to request_id" do
      expect do
        Activity.new(request_id: request.id)
      end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end

  describe "when request_id is not present" do
    before { @activity.request_id = nil }
    it { should_not be_valid }
  end

end

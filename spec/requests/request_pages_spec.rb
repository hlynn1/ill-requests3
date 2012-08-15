require 'spec_helper'

describe "request pages" do
  
  subject { page }
  
  describe "index" do
    
    let(:request) { FactoryGirl.create(:request) }
    
    before(:all) { 40.times { FactoryGirl.create(:request) } }
    after(:all) { Request.delete_all }
    
    it { should have_selector('title', text: "Requests") }
    it { should have_selector('h1', text: "Requests") }
    
#   describe "pagination" do

#      it { should have_selector('div.pagination') }

#      it "should list each request" do
#        Request.paginate(page: 1).each do |request|
#          page.should have_selector('td', text: request.title)
#        end
#      end

#    end
  end
  
end



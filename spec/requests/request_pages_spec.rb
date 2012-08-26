require 'spec_helper'

describe "request pages" do
  
  subject { page }
  
  describe "index" do
    
    let(:request) { FactoryGirl.create(:request) }

    before(:all) { 40.times { FactoryGirl.create(:request) } }
    after(:all) { Request.delete_all }
    
    before { visit requests_path }
    
    it { should have_selector('title', text: 'Requests') }
    it { should have_selector('h1', text: 'Requests') }
    it { should have_link('Details', href: request_path(Request.first)) }
    it { should have_link('Update', href: edit_request_path(Request.first)) }
    
    describe "pagination" do

      it { should have_selector('div.pagination') }

      it "should list each request" do
        Request.paginate(page: 1).each do |request|
          page.should have_selector('td', text: request.title)
        end
      end

    end
  end
  
  describe "request details page" do
    let(:request) { FactoryGirl.create(:request) }
    let!(:s1) { FactoryGirl.create(:status) }
    let!(:s2) { FactoryGirl.create(:status) }
    let!(:a1) { FactoryGirl.create(:activity, request: request, status_id: 2) }
    let!(:a2) { FactoryGirl.create(:activity, request: request, status_id: 1) }
    
    before { visit request_path(request) }
    
    it { should have_selector('h1', text: "Request Details") }
    it { should have_selector('title', text: "Request Details") }
    
    describe "activities" do
      it { should have_content(a1.status.name) }
      it { should have_content(a2.status.name) }
    end
  end
end



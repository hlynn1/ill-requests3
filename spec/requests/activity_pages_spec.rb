require 'spec_helper'

describe "ActivityPages" do
    subject { page }
    
    describe "return page" do
      before { visit return_path }
      it { should have_selector('h1', text: 'Return Item') }
      it { should have_selector('title', text: full_title('Return')) }
     end
end

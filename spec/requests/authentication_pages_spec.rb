require 'spec_helper'

describe "AuthenticationPages" do
  
  subject { page }
  
  describe "signin page" do
    before { visit signin_path }
    
    it { should have_selector('h1', text: 'Sign In') }
    it { should have_selector('title', text: 'Sign In') }  
  
    describe "with invalid information" do
      before { click_button "Sign In" }
      
        it { should have_selector('title', text: 'Sign In') }
        it { should have_error_message('Invalid') }
        
        describe "after visiting another page" do
          before { click_link "Home" }
          it { should_not have_selector('div.alert.alert-error') }
        end
    end
    
    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before { valid_signin(user) }
    
      it { should have_selector('title', text: user.name) }
      it { should have_selector('h1', text: user.name)}
      it { should have_link('Users', href: users_path) }
      it { should have_link('Your Info', href: user_path(user)) }
      it { should have_link('Sign Out', href: signout_path) }
      it { should_not have_link('Sign In', href: signin_path) }
      it { should have_link('Edit User', href: edit_user_path(user)) }
      
      describe "followed by signout" do
        before { click_link "Sign Out" }
        it { should have_link('Sign In') }
        it { should_not have_link('Users', href: users_path) }
      end
    end
  end
    
  describe "authorization" do
      
    describe "for non-signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      
      describe "when attempting to visit a protected page" do
        before do
          visit edit_user_path(user)
          fill_in "Location", with: user.locationcode
          fill_in "Password", with: user.password
          click_button "Sign In"
        end
        
        describe "after signing in" do
          
          it "should render the desired protected page" do
            page.should have_selector('title', text: 'Edit User')
          end
        end        
      end
      
      describe "in the Users controller" do
        
        describe "visiting the edit page" do
          before { visit edit_user_path(user) }
          it { should have_selector('title', text: 'Sign In') }
        end
        
        describe "submitting to the update action" do
          before { put user_path(user) }
          specify { response.should redirect_to(signin_path) }
        end
      
        describe "visiting the user index" do
          before { visit users_path }
          it { should have_selector('title', text: 'Sign In') }
        end
      
      end
    end
    
    describe "as wrong user" do
      let(:user) { FactoryGirl.create(:user) }
      let(:wrong_user) { FactoryGirl.create(:user, locationcode: "PQR", email: "wrong@example.com") }
      before { sign_in user }
      
      describe "visiting Users#edit page" do
        before { visit edit_user_path(wrong_user) }
        it { should_not have_selector('title', text: full_title('Edit User')) }
      end
      
      describe "submitting a PUT request to the Users#update action" do
        before { put user_path(wrong_user) }
        specify { response.should redirect_to(root_path) }
      end
    end
  
    describe "as non-admin user" do
      let(:user) { FactoryGirl.create(:user) }
      let(:non_admin) { FactoryGirl.create(:user) }
      
      before { sign_in non_admin }
      
      describe "submitting a DELETE requests to the Users#destroy action" do
        before { delete user_path(user) }
        specify { response.should redirect_to(root_path) }
      end
    end
    
  end
  
end

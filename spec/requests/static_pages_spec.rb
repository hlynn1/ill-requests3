require 'spec_helper'

describe "StaticPages" do

  describe "Home page" do
    
    it "should have the h1 'ILL Requests'" do
      visit '/static_pages/home'
      page.should have_selector('h1', :text => 'ILL Requests')
    end
    
    it "should have the title 'Home'" do
      visit '/static_pages/home'
      page.should have_selector('title', :text => "ILL Requests | Home")
    end
  
  end
  
  describe "Help page" do

    it "should have the h1 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('h1', :text => 'Help')
    end
    
    it "should have the title 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('title', :text => "ILL Requests | Help")
    end
  
  end
  
  describe "About page" do
    
    it "should have the h1 'About This App'" do
      visit '/static_pages/about'
      page.should have_selector('h1', :text => 'About This App')
    end
    
    it "should have the title 'About'" do
      visit '/static_pages/about'
      page.should have_selector('title', :text => "ILL Requests | About")
    end
    
  end
  
end

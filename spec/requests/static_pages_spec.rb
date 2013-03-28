require 'spec_helper'

describe "StaticPages" do
  describe "Home Page" do
    it "should have the content 'Sample App'" do
    	visit '/static_pages/home' #visit => Capybara method loads content into 'page'
    	page.should have_content('Sample App')
    end
  end

  describe "Help Page" do
  	it "should have the content 'Help'" do
  		visit '/static_pages/help'
  		page.should have_content('Help')
  	end
  end

  describe "About page" do
    it "should have the content 'About this unnecessary page'" do
      visit '/static_pages/about'
      page.should have_content('About this unnecessary page')
    end
  end
end

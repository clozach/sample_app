require 'spec_helper'

describe "StaticPages" do
  %w[Home Help About].each do |file|
    it "should contain #{file} in the title" do
      lower = file.downcase
      visit "/static_pages/#{lower}" #visit => Capybara method loads content into 'page'
      page.should have_selector('title', text: "Sample App | #{file}")
    end
  end

  describe "Home Page" do
    it "should have the content 'Sample App'" do
    	visit '/static_pages/home' #visit => Capybara method loads content into 'page'
    	page.should have_selector('h1', text: 'Sample App')
    end
  end

  describe "Help Page" do
  	it "should have the content 'Help'" do
  		visit '/static_pages/help'
      page.should have_selector('h1', text: 'Help')
  	end
  end

  describe "About page" do
    it "should have the content 'About this unnecessary page'" do
      visit '/static_pages/about'
      page.should have_selector('h1', text: 'About this unnecessary page')
    end
  end
end

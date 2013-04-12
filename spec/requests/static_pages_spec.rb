require 'spec_helper'

describe "StaticPages" do
  let(:base_title) { "Sample App" }

  context "Title tag"
  %w[Home Help About Contact].each do |file|
    it "should contain base_title and #{file}" do
      lower = file.downcase 
      visit "/static_pages/#{lower}" #visit => Capybara method loads content into 'page'
      p file
      page.should have_selector('title', text: "#{base_title} | #{file}")
    end
  end

  context "Home Page" do
    it "should have the content base_title" do
    	visit '/static_pages/home' #visit => Capybara method loads content into 'page'
    	page.should have_selector('h1', text: base_title)
    end
  end

  context "Help Page" do
  	it "should have the content 'Help'" do
  		visit '/static_pages/help'
      page.should have_selector('h1', text: 'Help')
  	end
  end

  context "About page" do
    it "should have the content 'About this unnecessary page'" do
      visit '/static_pages/about'
      page.should have_selector('h1', text: 'About this unnecessary page')
    end
  end

  context "Contact page" do
    it "should have the h1 'Contact'" do
      visit '/static_pages/contact'
      page.should have_selector('h1', text: 'Do not contact me, please')
    end
  end
end

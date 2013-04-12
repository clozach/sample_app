require 'spec_helper'

describe "StaticPages" do
  let(:base_title) { "Sample App" }

  context "Title tag"
  %w[Help About Contact].each do |file|
    it "should contain base_title and #{file}" do
      lower = file.downcase 
      path = "#{lower}_path"
      visit send(path) #visit => Capybara method loads content into 'page'
      page.should have_selector('title', text: "#{base_title} | #{file}")
    end
  end

  context "Home Page" do
    before { visit root_path } #visit => Capybara method loads content into 'page'

    it "should have the content base_title" do
    	page.should have_selector('h1', text: base_title)
    end

    it "should NOT have Home in the title" do
      page.should_not have_selector('title', text: "Home")
    end

    it "should NOT have a pipe" do
      page.should_not have_selector('title', text: "|")
    end
  end

  context "Help Page" do
  	it "should have the content 'Help'" do
  		visit help_path
      page.should have_selector('h1', text: 'Help')
  	end
  end

  context "About page" do
    it "should have the content 'About this unnecessary page'" do
      visit about_path
      page.should have_selector('h1', text: 'About this unnecessary page')
    end
  end

  context "Contact page" do
    it "should have the h1 'Contact'" do
      visit contact_path
      page.should have_selector('h1', text: 'Do not contact me, please')
    end
  end
end

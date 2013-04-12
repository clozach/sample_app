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

  # Set subject of remaining tests
  subject { page }

  context "Home Page" do
    before { visit root_path } #visit => Capybara method loads content into 'page'

    it { should have_selector('h1', text: base_title) }
    it { should_not have_selector('title', text: "Home") }
    it { should_not have_selector('title', text: "|") }
  end

  context "Help Page" do
    before { visit help_path }
    it { should have_selector('h1', text: 'Help') }
  end

  context "About page" do
    before {visit about_path }
    it { should have_selector('h1', text: 'About this unnecessary page') }
  end

  context "Contact page" do
    before { visit contact_path }
    it { should have_selector('h1', text: 'Do not contact me, please') }
  end
end

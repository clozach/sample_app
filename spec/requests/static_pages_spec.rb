require 'spec_helper'

describe "StaticPages" do

  subject { page }

  shared_examples_for "all static pages" do
    it { should have_selector('h1', text: heading) }
    it { should have_selector('title', text: full_title(page_title)) }
  end

  describe "Home Page" do
    before { visit root_path } #visit => Capybara method loads content into 'page'
    let(:page_title) { '' }
    let(:heading) { 'Sample App' }
    it_should_behave_like "all static pages"
    it { should_not have_selector('title', text: "|") }
  end

  describe "Help Page" do
    before { visit help_path }
    let(:page_title) { 'Help' }
    let(:heading) { 'Help' }
    it_should_behave_like "all static pages"
    it { should have_selector('h1', text: 'Help') }
  end

  describe "About page" do
    before { visit about_path }
    let(:page_title) { 'About' }
    let(:heading) { 'About this unnecessary page' }
    it_should_behave_like "all static pages"
  end

  describe "Contact page" do
    before { visit contact_path }
    let(:page_title) { 'Contact' }
    let(:heading) { 'Do not contact me, please' }
  end
end

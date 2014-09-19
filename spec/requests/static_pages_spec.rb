require 'spec_helper'

describe "静态页面测试" do

  let(:basic_title) { "Ruby on Rails Tutorial Sample App" }
  
  subject{ page }

  shared_examples_for "all static pages" do
    it{ should have_content(heading) }
    it{ should have_title(full_title(page_title)) }
  end

  describe "主页" do
    before { visit root_path }
    let(:heading) { 'Sample App' }
    let(:page_title) { '' }

    it_should_behave_like "all static pages"
    it { should_not have_title('|Home') }
  end

  describe"帮助页面" do
    before{ visit help_path }
    let(:heading) { 'Help' }
    let(:page_title) { 'Help' }
  end

  describe"关于页面" do
    before { visit about_path }

    it{ should have_selector('h1', :text => 'About') }
    it{ should have_title(full_title('About Us')) }
  end

  describe"联系页面" do

    before{ visit contact_path }
    it{ should have_content('Contact') }
    it{ should have_title('Contact') }
  end

  describe "测试连接" do
    before{ visit root_path }
    it "should have the right link in home page" do

      click_link "About"
      expect(page).to have_title(full_title('About Us'))
      click_link "Help"
      expect(page).to have_title(full_title('Help'))
      click_link "Contact"
      expect(page).to have_title(full_title('Contact'))
      click_link "Home"
      click_link "Sign up now!"
    end
  end

  describe "signup page" do
    before{ visit signup_path }
    it{ should have_content('Sign up') }
    it{ should have_title(full_title('Sign up')) }
  end

  describe "profile page" do

    let(:user) { FactoryGirl.create(:user) }

    before{ visit user_path(user) }

    it{ should have_content(user.name) }

    it{ should have_title(user.name) }
  end

end

  

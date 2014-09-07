require 'spec_helper'

describe "静态页面测试" do

  describe "Home page" do
    it "必须提供样本内容" do
      visit '/static_pages/home'
      expect(page).to have_content('Sample App')
    end

    it"必须有正确标题" do
      visit '/static_pages/home'
      expect(page).to have_title("Ruby on Rails Tutorial Sample App | Home")
    end
  end

  describe"帮助页面" do

    it "should have the content 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_content('Help')
    end

    it"必须有正确标题" do
      visit '/static_pages/help'
      expect(page).to have_title("Ruby on Rails Tutorial Sample App | Help")
    end
  end

  describe"关于页面" do

    it"内容必须关于我们" do
      visit '/static_pages/about'
      expect(page).to have_content('About Us')
    end

    it"必须有正确标题" do
      visit '/static_pages/about'
      expect(page).to have_title("Ruby on Rails Tutorial Sample App | About")
    end
  end

end

  

require 'spec_helper'

describe "静态页面测试" do

  let(:basic_title) { "Ruby on Rails Tutorial Sample App" }

  describe "Home page" do
    it "必须提供样本内容" do
      visit '/static_pages/home'
      expect(page).to have_content('Sample App')
    end

    it"必须有基本标题" do
      visit '/static_pages/home'
      expect(page).to have_title("#{ basic_title }")
    end

    it"没有自定义标题" do
      visit '/static_pages/home'
      expect(page).not_to have_title('| Home')
    end
  end

  describe"帮助页面" do

    it "should have the content 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_content('Help')
    end

    it"必须有正确标题" do
      visit '/static_pages/help'
      expect(page).to have_title("#{ basic_title } | Help")
    end
  end

  describe"关于页面" do

    it"内容必须关于我们" do
      visit '/static_pages/about'
      expect(page).to have_content('About Us')
    end

    it"必须有正确标题" do
      visit '/static_pages/about'
      expect(page).to have_title("#{ basic_title } | About")
    end
  end

  describe"联系页面" do

    it "内容必须包含联系" do
      visit '/static_pages/contact'
      expect(page).to have_content('Contact')
    end

    it"必须有正确的标题" do
      visit '/static_pages/contact'
      expect(page).to have_title("#{ basic_title } | Contact")
    end
  end

end

  

require 'spec_helper'

describe "静态页面测试" do

  let(:basic_title) { "Ruby on Rails Tutorial Sample App" }
  
  subject{ page }

  describe "主页" do
    before { visit root_path }
    it { should have_content('Sample App') }
    it { should have_title(full_title('Home')) }
    #it { should_not have_title('|Home') }
  end

  describe"帮助页面" do

    it "should have the content 'Help'" do
      visit help_path
      expect(page).to have_content('Help')
    end

    it"必须有正确标题" do
      visit help_path
      expect(page).to have_title(full_title('Help'))
    end
  end

  describe"关于页面" do

    it"内容必须关于我们" do
      visit about_path
      expect(page).to have_content('About')
    end

    it"必须有正确标题" do
      visit about_path
      expect(page).to have_title(full_title('About Us'))
    end
  end

  describe"联系页面" do

    it "内容必须包含联系" do
      visit contact_path
      expect(page).to have_content('Contact')
    end

    it"必须有正确的标题" do
      visit contact_path
      expect(page).to have_title(full_title('Contact'))
    end
  end

end

  

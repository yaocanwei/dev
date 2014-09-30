require 'spec_helper'

describe "Authentication" do
  subject{ page }

  describe "signin page" do
    before { visit signin_path }

    it{ should have_content('Sign in') }
    it{ should have_title('Sign in') }

    describe "with invalid information" do
      let (:submit) { 'Sign in' }

      before { click_button  submit}
      it { should have_title('Sign in') }
      it { should have_selector('div.alert.alert-error', text: 'Invalid') } 

      describe "after visiting another page " do
        before{ click_link "Home" }
        it{ should_not have_selector('div.alert.alert-error') }
      end
    end

    describe "with valid information" do
      let(:user){ FactoryGirl.create(:user) }
      before{ sign_in user }
      before do
        fill_in "Email",    with: user.email.downcase
        fill_in "Password", with: user.password
        click_button "Sign in"
      end

      before do
        click_link "Account"
      end
      it { should have_title(user.name) }
      it { should have_link('Profile',     href: user_path(user)), visiable: false }
      it { shoudl have_link('Settings', href: edit_user_path(user)) }
      it { should have_link('Sign out',    href: signout_path) }
      it { should_not have_link('Sign in', href: signin_path) }
    end
  end
end

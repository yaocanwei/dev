require 'spec_helper'

describe '用户界面' do
  subject { page }
  describe 'signup page' do
    before { visit signup_path }
    it { should have_content('Sign up') }
    it { should have_title(full_title('Sign up')) }
  end

  describe "signup" do
    before { visit signup_path }

    let(:submit){ "创建帐号" }

    describe "with invalid information" do

      it"should not create a user" do

        #equal to
        #initial = User.count
        #click_button "Create my account"
        #final = User.count
        #expect(initial).to eq final#相当于前后用户数量不变
        #两者字面意义一样
        expect { click_button submit }.not_to change(User, :count)

      end
<<<<<<< HEAD
=======
      describe "after submission" do
        before { click_button submit }
        it{ should have_title('Sign up') }
        it{ should have_content('error') }
      end
>>>>>>> sign-in-out
    end

    describe "with valid information" do

      before do
        fill_in "用户名",  with: "YCanwei"
<<<<<<< HEAD
        fill_in "邮箱", with: "a1248014498@gmail.com"
=======
        fill_in "邮箱", with: "1248014498@qq.com"
>>>>>>> sign-in-out
        fill_in "密码输入", with: "foobar"
        fill_in "确认密码", with: "foobar"
      end

      #When it register successfully, the database can create a new user.
      it "should create a user" do
        expect{ click_button submit }.to change(User, :count).by(1)
      end
<<<<<<< HEAD
=======
      describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by(email: '1248014498@qq.com') }

        it { should have_link('Sign out')}
        it { should have_title(user.name) }
        it { should have_selector('div.alert.alert-success', text: 'Welcome') }
      end
>>>>>>> sign-in-out
    end
  end
end

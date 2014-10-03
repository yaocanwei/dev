require 'spec_helper'

describe '用户界面' do

  subject { page }

  #用户列表
  describe "index" do
    #before do
      #sign_in FactoryGirl.create(:user)
      #FactoryGirl.create(:user, name: "Bob", email: "bob@example.com") 
      #FactoryGirl.create(:user, name: "Ben", email: "ben@example.com")
      ##10.times do
        ##FactoryGirl.create(:user)
      ##end
      #visit users_path
    #end
    let(:user) { FactoryGirl.create(:user) }
    before(:each) do
      sign_in user
      visit users_path
    end

    describe "pagination" do
      before(:all) { 30.times { FactoryGirl.create(:user) } }
      after(:all) { User.delete_all }

      it{ should have_selector('div.pagination') }
      it "should list each user" do
        User.paginate(page: 1).each do|user|
          expect(page).to have_selector('li', text: user.name)
        end
      end
    end

    describe "delete links" do
      it { should_not have_link('delete') }

      describe "as an admin user" do
        let(:admin) { FactoryGirl.create(:admin) }

        before do
          sign_in admin
          visit users_path
        end

        it{ should have_link('删除', href: user_path(User.first)) }
        it "should be able to delete another user" do
          expect do
            #match: :first删除第一次点击的
            click_link('删除', match: :first)
          end.to change(User, :count).by(-1)
        end

        it { should_not have_link('delete', href: user_path(admin)) }
      end
    end

    it { should have_title('All users') }
    it { should have_content('All users')}

    it "should list each user" do
      User.all.each do |user|
        expect(page).to have_selector('li', text: user.name)
      end
    end
  end

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

      describe "after submission" do
        before { click_button submit }
        it{ should have_title('Sign up') }
        it{ should have_content('error') }
      end
    end

    describe "with valid information" do

      before do
        fill_in "用户名",  with: "YCanwei"
        #fill_in "邮箱", with: "a1248014498@gmail.com"
        fill_in "邮箱", with: "1248014498@qq.com"
        fill_in "密码输入", with: "foobar"
        fill_in "确认密码", with: "foobar"
      end

      #When it register successfully, the database can create a new user.
      it "should create a user" do
        expect{ click_button submit }.to change(User, :count).by(1)
      end

      describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by(email: '1248014498@qq.com') }

        it { should have_link('Sign out')}
        it { should have_title(user.name) }
        it { should have_selector('div.alert.alert-success', text: 'Welcome') }
      end
    end
  end
  describe "编辑用户资料" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      sign_in user
      visit edit_user_path(user)
    end

    describe "forbidden attributes" do
      let(:params) do
        { 
          user:{ 
            admin: true, 
            password: user.password,
            password_confirmation: user.password
          }
        }
      end
      before { patch user_path(user), params }
      specify { expect(user.reload).not_to be_admin }
    end

    describe "页面描述" do
      it{ should have_content("Update your profile") }
      it{ should have_title("Edit user") }
      it{ should have_link('change', href: 'http://gravatar.com/emails') }
    end

    describe "with valid information" do
      let(:new_name) { "Mark" }
      let(:new_email) { "18824864765@gmail.com" }
      before do
        fill_in "Name",    with: new_name 
        fill_in "Email",   with: new_email
        fill_in "Password", with: user.password
        fill_in "Confirm Password", with: user.password
        click_button "Save changes"

        it { should haveø_title(new_name) }
        it { should_have_selector('div.alert.alert-success') }
        it { should have_link('Sign out', href: signout_path)}
        specify { expect(user.reload.name).to eq new_name }
        specify { expect(user.reload.email).to eq new_email }
      end
    end

    describe "with invalid information" do
      before { click_button 'Save changes' }

      it{ should have_content('error') }
    end
  end
end

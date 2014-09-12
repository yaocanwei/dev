require 'spec_helper'

describe '用户界面' do
  subject { page }
  describe 'signup page' do
    before { visit signup_path }
    it { should have_content('Sign up') }
    it { should have_title(full_title('Sign up')) }
  end
end

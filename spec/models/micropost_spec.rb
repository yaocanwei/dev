require 'spec_helper'

describe Micropost do
  #pending "add some examples to (or delete) #{__FILE__}"
  let(:user) { FactoryGirl.create(:user) }
  before do
    @micropost = user.microposts.build(content: "Find the way to lean rails well", user_id: user.id)
  end

  subject { @micropost }

  it{ should respond_to(:content) }
  it{ should respond_to(:user_id) }
  it{ should respond_to(:user) }
  #:user means the micropost generate
  #user means the let method generate
  its(:user) { should eq user }

  it{ should be_valid }

  describe "when user_id is not present" do
    before { @micropost.user_id = nil }
    it { should_not be_valid }
  end

end

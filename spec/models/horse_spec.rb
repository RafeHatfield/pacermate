require 'spec_helper'

describe Horse do

  let(:user) { FactoryGirl.create(:user) }

  before { @horse = user.horses.build(stable_name: "Lorem ipsum") }

  subject { @horse }

  it { should respond_to(:racing_name) }
  it { should respond_to(:stable_name) }
  it { should respond_to(:sex) }
  it { should respond_to(:colour) }
  it { should respond_to(:foal_date) }
  it { should respond_to(:user_id) }
  its(:user) { should == user }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @horse.user_id = nil }
    it { should_not be_valid }
  end

  describe "when stable_name is not present" do
    before { @horse.stable_name = nil }
    it { should_not be_valid }
  end

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Horse.new(user_id: user.id)
      end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end    
  end

end
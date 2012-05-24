require 'spec_helper'

describe Horse do

  let(:user) { FactoryGirl.create(:user) }

  before do
    # This code is wrong!
    @horse = Horse.new(racing_name: 'Racing Name', stable_name: 'Stabby', sex: 1, colour: 'Bay', foal_date: 3.years.ago, user_id: user.id)
  end 

  subject { @horse }

  it { should respond_to(:racing_name) }
  it { should respond_to(:stable_name) }
  it { should respond_to(:sex) }
  it { should respond_to(:colour) }
  it { should respond_to(:foal_date) }
  it { should respond_to(:user_id) }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @horse.user_id = nil }
    it { should_not be_valid }
  end

  describe "when user_id is not present" do
    before { @horse.stable_name = nil }
    it { should_not be_valid }
  end

end
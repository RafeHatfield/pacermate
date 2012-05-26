require 'spec_helper'

describe "Horse pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "horse creation" do
    before { visit root_path }

    describe "with invalid information" do

      it "should not create a horse" do
        expect { click_button "Post" }.should_not change(Horse, :count)
      end

      describe "error messages" do
        before { click_button "Post" }
        it { should have_content('error') } 
      end
    end

    describe "with valid information" do

      before do
        fill_in 'horse_stable_name', with: "Test Name"
      end

      # before { fill_in 'horse_stable_name', with: "Test Name" }

      it "should create a horse" do
        expect { click_button "Post" }.should change(Horse, :count).by(1)
      end
    end
  end
end
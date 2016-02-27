require 'rails_helper'

RSpec.describe User, type: :model do
  it { should be_activitable }
  it { should be_accompaniable }
  it { should be_experienceable }
  it { should be_learnable }

  it { should have_many :activities }
  it { should have_many :accompaniments }
  it { should have_many :experiences }
  it { should have_many :learnings }

  let(:user) { FactoryGirl.create(:user) }

  describe '#todays_activities' do
    let!(:activity_1) { FactoryGirl.create(:activity, activitable: user) }
    let!(:activity_2) { FactoryGirl.create(:activity, activitable: user) }
    let!(:activity_3) { FactoryGirl.create(:activity, activitable: user) }

    before do
      allow(activity_1).to receive(:next_occurrence).and_return(Date.today)
      allow(activity_2).to receive(:next_occurrence).and_return(Date.today - 1.day)
      allow(activity_3).to receive(:next_occurrence).and_return(Date.today + 1.day)
      allow(user).to receive(:activities).and_return([activity_1, activity_2, activity_3])
    end

    it 'lists only todays activities' do
      expect(user.todays_activities).to include activity_1
      expect(user.todays_activities).not_to include activity_2
      expect(user.todays_activities).not_to include activity_3
    end
  end
end

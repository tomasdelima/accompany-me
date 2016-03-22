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

  describe '#todays_activities' do
    let(:user)        { FactoryGirl.create(:user) }
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

  let(:user)          { FactoryGirl.create(:user, :with_one_friend) }
  let(:friend)        { user.friends.first }
  let(:activity)      { FactoryGirl.create :activity, activitable: user }
  let(:accompaniment) { FactoryGirl.create :accompaniment, accompaniable: user }
  let(:experience)    { FactoryGirl.create :experience, experienceable: user }
  let(:learning)      { FactoryGirl.create :learning, learnable: user }

  describe '#all_activities' do
    let!(:cascaded_activity_1)    { FactoryGirl.create :activity, activitable: friend }
    let!(:someone_elses_activity) { FactoryGirl.create :activity }

    it "lists user's activities" do
      expect(user.all_activities).to include(activity)
    end

    it "lists all user's cascaded activities" do
      expect(user.all_activities).to include(cascaded_activity_1)
    end

    it "does not list unrealted activities" do
      expect(user.all_activities).not_to include(someone_elses_activity)
    end
  end

  describe '#all_accompaniments' do
    let!(:cascaded_accompaniment_1)    { FactoryGirl.create :accompaniment, accompaniable: friend }
    let!(:cascaded_accompaniment_2)    { FactoryGirl.create :accompaniment, accompaniable: activity }
    let!(:someone_elses_accompaniment) { FactoryGirl.create :accompaniment }

    it "lists user's accompaniments" do
      expect(user.all_accompaniments).to include(accompaniment)
    end

    it "lists all user's cascaded accompaniments" do
      expect(user.all_accompaniments).to include(cascaded_accompaniment_1)
      expect(user.all_accompaniments).to include(cascaded_accompaniment_2)
    end

    it "does not list unrealted accompaniments" do
      expect(user.all_accompaniments).not_to include(someone_elses_accompaniment)
    end
  end

  describe '#all_experiences' do
    let!(:cascaded_experience_1)    { FactoryGirl.create :experience, experienceable: friend }
    let!(:cascaded_experience_2)    { FactoryGirl.create :experience, experienceable: activity }
    let!(:cascaded_experience_3)    { FactoryGirl.create :experience, experienceable: accompaniment }
    let!(:someone_elses_experience) { FactoryGirl.create :experience }

    it "lists user's experiences" do
      expect(user.all_experiences).to include(experience)
    end

    it "lists all user's cascaded experiences" do
      expect(user.all_experiences).to include(cascaded_experience_1)
      expect(user.all_experiences).to include(cascaded_experience_2)
      expect(user.all_experiences).to include(cascaded_experience_3)
    end

    it "does not list unrealted experiences" do
      expect(user.all_experiences).not_to include(someone_elses_experience)
    end
  end

  describe '#all_learnings' do
    let!(:cascaded_learning_1)    { FactoryGirl.create :learning, learnable: friend }
    let!(:cascaded_learning_2)    { FactoryGirl.create :learning, learnable: activity }
    let!(:cascaded_learning_3)    { FactoryGirl.create :learning, learnable: accompaniment }
    let!(:cascaded_learning_4)    { FactoryGirl.create :learning, learnable: experience }
    let!(:someone_elses_learning) { FactoryGirl.create :learning }

    it "lists user's learnings" do
      expect(user.all_learnings).to include(learning)
    end

    it "lists all user's cascaded learnings" do
      expect(user.all_learnings).to include(cascaded_learning_1)
      expect(user.all_learnings).to include(cascaded_learning_2)
      expect(user.all_learnings).to include(cascaded_learning_3)
      expect(user.all_learnings).to include(cascaded_learning_4)
    end

    it "does not list unrealted learnings" do
      expect(user.all_learnings).not_to include(someone_elses_learning)
    end
  end
end

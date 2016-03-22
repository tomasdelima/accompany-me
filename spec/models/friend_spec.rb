require 'rails_helper'

RSpec.describe Friend, type: :model do
  it { should be_activitable }
  it { should be_accompaniable }
  it { should be_experienceable }
  it { should be_learnable }

  it { should have_many :activities }
  it { should have_many :accompaniments }
  it { should have_many :experiences }
  it { should have_many :learnings }

  let(:user)          { FactoryGirl.create(:user, :with_one_friend) }
  let(:friend)        { user.friends.first }
  let(:activity)      { FactoryGirl.create :activity, activitable: user }
  let(:accompaniment) { FactoryGirl.create :accompaniment, accompaniable: user }
  let(:experience)    { FactoryGirl.create :experience, experienceable: user }
  let(:learning)      { FactoryGirl.create :learning, learnable: user }

  let(:new_friend)    { Friend.new(email: 'friend@email.com') }

  it 'does not validate password' do
    expect(new_friend).to be_valid
  end
end

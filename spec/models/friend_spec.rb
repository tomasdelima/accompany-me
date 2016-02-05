require 'rails_helper'

describe Friend, type: :model do
  let(:friend)     { FactoryGirl.create :friend }
  let(:activity_1) { FactoryGirl.create :activity, organizer: friend }
  let(:activity_2) { FactoryGirl.create :activity, organizer: friend }
  let(:activity_3) { FactoryGirl.create :activity }

  it { should belong_to :user }
  it { should have_and_belong_to_many :activities }
  it { should have_many :accompaniments }
  it { should have_many :learnings }
  it { should validate_presence_of :name }

  describe '#activities_organizing' do
    it 'lists the activities it organizes' do
      expect(friend.activities_organizing).to include(activity_1)
      expect(friend.activities_organizing).to include(activity_2)
    end

    it 'does not lists the activities it does not organizes' do
      expect(friend.activities_organizing).not_to include(activity_3)
    end
  end

  describe '#days_since_last_accompanied' do
    context 'when there is a last accompanied date' do
      let(:friend) { FactoryGirl.create :friend, last_accompanied: Date.today - 3.days }

      it 'returns the number of days since the day it was accompanied' do
        expect(friend.days_since_last_accompanied).to be(3)
      end
    end

    context 'when there is not a last accompanied date' do
      let(:friend) { FactoryGirl.create :friend, last_accompanied: nil }

      it 'returns the number of days since the day it was accompanied' do
        expect(friend.days_since_last_accompanied).to be(nil)
      end
    end
  end

  describe '#next_accompaniment_in' do
    context 'when there is a last accompanied date and an accompaniment frequency' do
      let(:friend) { FactoryGirl.create :friend, last_accompanied: Date.today - 3.days, accompaniment_frequency: 7 }

      it 'returns the number of days until the next accompaniment' do
        expect(friend.next_accompaniment_in).to be(4)
      end
    end

    context 'when there is not a last accompanied date' do
      let(:friend) { FactoryGirl.create :friend, last_accompanied: nil, accompaniment_frequency: 7 }

      it 'returns the number of days until the next accompaniment' do
        expect(friend.next_accompaniment_in).to be(nil)
      end
    end

    context 'when there is not an accompaniment frequency' do
      let(:friend) { FactoryGirl.create :friend, last_accompanied: Date.today - 3.days, accompaniment_frequency: nil }

      it 'returns the number of days until the next accompaniment' do
        expect(friend.next_accompaniment_in).to be(nil)
      end
    end
  end
end

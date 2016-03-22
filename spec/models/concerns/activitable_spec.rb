require 'rails_helper'

RSpec.describe Activitable do
  context 'when there are records with the same related_id, but only one is really related to the subject' do
    let!(:user)       { FactoryGirl.create(:user, :with_one_friend) }
    let!(:activity_1) { FactoryGirl.create :activity, activitable_id: user.id, activitable_type: 'User' }
    let!(:activity_2) { FactoryGirl.create :activity, activitable_id: user.id, activitable_type: 'SomethingElse' }

    it 'returns only the related object' do
      expect(user.activities.count).to eq 1
    end
  end
end

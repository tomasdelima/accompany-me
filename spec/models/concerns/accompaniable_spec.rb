require 'rails_helper'

RSpec.describe Accompaniable do
  context 'when there are records with the same related_id, but only one is really related to the subject' do
    let!(:user)         { FactoryGirl.create(:user, :with_one_friend) }
    let!(:accompaniment_1) { FactoryGirl.create :accompaniment, accompaniable_id: user.id, accompaniable_type: 'User' }
    let!(:accompaniment_2) { FactoryGirl.create :accompaniment, accompaniable_id: user.id, accompaniable_type: 'SomethingElse' }

    it 'returns only the related object' do
      expect(user.accompaniments.count).to eq 1
    end
  end
end

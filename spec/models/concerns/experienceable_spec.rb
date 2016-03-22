require 'rails_helper'

RSpec.describe Experienceable do
  context 'when there are records with the same related_id, but only one is really related to the subject' do
    let!(:user)         { FactoryGirl.create(:user, :with_one_friend) }
    let!(:experience_1) { FactoryGirl.create :experience, experienceable_id: user.id, experienceable_type: 'User' }
    let!(:experience_2) { FactoryGirl.create :experience, experienceable_id: user.id, experienceable_type: 'SomethingElse' }

    it 'returns only the related object' do
      expect(user.experiences.count).to eq 1
    end
  end
end

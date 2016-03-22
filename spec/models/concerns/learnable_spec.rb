require 'rails_helper'

RSpec.describe Learnable do
  context 'when there are records with the same related_id, but only one is really related to the subject' do
    let!(:user)       { FactoryGirl.create(:user, :with_one_friend) }
    let!(:learning_1) { FactoryGirl.create :learning, learnable_id: user.id, learnable_type: 'User' }
    let!(:learning_2) { FactoryGirl.create :learning, learnable_id: user.id, learnable_type: 'SomethingElse' }

    it 'returns only the related object' do
      expect(user.learnings.count).to eq 1
    end
  end
end

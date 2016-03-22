require 'rails_helper'

RSpec.describe Experience, type: :model do
  it { should_not be_activitable }
  it { should_not be_accompaniable }
  it { should_not be_experienceable }
  it { should be_learnable }

  it { should belong_to :experienceable }

  it { should have_many :learnings }

  let(:experience) { FactoryGirl.create :experience, description: (0..300).reduce{|a,m| m = "#{a}#{m}"} }

  describe '#name' do
    it 'returns the descriptions first 100 characters' do
      expect(experience.name.length).to eq 100
    end
  end
end

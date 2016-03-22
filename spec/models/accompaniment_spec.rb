require 'rails_helper'

RSpec.describe Accompaniment, type: :model do
  it { should_not be_activitable }
  it { should_not be_accompaniable }
  it { should be_experienceable }
  it { should be_learnable }

  it { should belong_to :accompaniable }

  it { should have_many :experiences }
  it { should have_many :learnings }

  it { should validate_presence_of :subject }

  let(:accompaniment) { FactoryGirl.create :accompaniment }

  describe '#name' do
    it 'returns the subject' do
      expect(accompaniment.name).to eq accompaniment.subject
    end
  end
end
